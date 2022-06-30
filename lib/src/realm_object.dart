////////////////////////////////////////////////////////////////////////////////
//
// Copyright 2021 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
import 'dart:async';

import 'list.dart';
import 'native/realm_core.dart';
import 'realm_class.dart';

abstract class RealmAccessor {
  T getValue<T extends Object?>(RealmObject object, ValueProperty<T> property);
  T? getObject<T extends RealmObject>(RealmObject object, ObjectProperty<T> property);
  RealmList<T> getList<T extends Object?>(RealmObject object, ListProperty<T> property);
  void set<T extends Object?>(RealmObject object, ValueProperty<T> property, T value, [bool isDefault = false]);
}

class RealmValuesAccessor implements RealmAccessor {
  final Map<String, Object?> _values = <String, Object?>{};

  @override
  T getValue<T extends Object?>(RealmObject object, ValueProperty<T> property) => _get<T>(property);

  @override
  T? getObject<T extends RealmObject>(RealmObject object, ObjectProperty<T> property) => _get<T?>(property);

  @override
  RealmList<T> getList<T extends Object?>(RealmObject object, ListProperty<T> property) => _get<RealmList<T>>(property);

  T _get<T extends Object?>(ValueProperty<T> property) => _values[property.name] as T;

  @override
  void set<T extends Object?>(RealmObject object, ValueProperty<T> property, T value, [bool isDefault = false]) {
    final name = property.name;
    _values[name] = value;
  }

  void setAll(RealmObject object, RealmAccessor accessor) {
    for (final p in object.properties.values) {
      var value = _values[p.name];
      final isDefault = value == null;
      value ??= p.defaultValue;
      accessor.set(object, p, value, isDefault);
    }
  }
}

class RealmMetadata {
  final RealmClassMetadata classMeta;
  final Map<String, RealmPropertyMetadata> _byName;
  final Map<int, RealmPropertyMetadata> _byKey;

  RealmMetadata(this.classMeta, Iterable<RealmPropertyMetadata> metadata)
      : _byKey = <int, RealmPropertyMetadata>{for (final m in metadata) m.key: m},
        _byName = <String, RealmPropertyMetadata>{for (final m in metadata) m.property.name: m};

  RealmPropertyMetadata operator [](String propertyName) =>
      _byName[propertyName] ?? (throw RealmException("Property $propertyName does not exists on class ${classMeta.type.runtimeType}"));

  RealmPropertyMetadata getPropertyMetaByKey(int propertyKey) => _byKey[propertyKey]!;
}

class RealmClassMetadata {
  final int key;
  final SchemaObject schema;

  RealmClassMetadata(this.key, this.schema);

  Type get type => schema.type;
  ValueProperty? get primaryKey => schema.primaryKey;
}

class RealmPropertyMetadata {
  final int key;
  final ValueProperty property;
  const RealmPropertyMetadata(this.key, this.property);
}

class RealmCoreAccessor implements RealmAccessor {
  final RealmMetadata metadata;

  RealmCoreAccessor(this.metadata);

  @override
  T getValue<T extends Object?>(RealmObject object, ValueProperty<T> property) {
    final name = property.name;
    final propertyMeta = metadata[name];
    final value = realmCore.getProperty(object, propertyMeta.key);
    return value as T;
  }

  @override
  T? getObject<T extends RealmObject>(RealmObject object, ObjectProperty<T> property) {
    final name = property.name;
    final propertyMeta = metadata[name];
    final value = realmCore.getProperty(object, propertyMeta.key);
    if (value is RealmObjectHandle) {
      return object.realm.createObject<T>(value);
    }
    return null;
  }

  @override
  RealmList<ElementT> getList<ElementT extends Object?>(RealmObject object, ListProperty<ElementT> property) {
    final name = property.name;
    final propertyMeta = metadata[name];
    final handle = realmCore.getListProperty(object, propertyMeta.key);
    return object.realm.createList<ElementT>(handle);
  }

  @override
  void set<T extends Object?>(RealmObject object, ValueProperty<T> property, T value, [bool isDefault = false]) {
    final name = property.name;
    final propertyMeta = metadata[name];
    try {
      if (value is List) {
        if (value.isEmpty) {
          return;
        }

        //This assumes the target list property is empty. `value is List` should happen only when making a RealmObject managed
        final handle = realmCore.getListProperty(object, propertyMeta.key);
        for (var i = 0; i < value.length; i++) {
          RealmListInternal.setValue(handle, object.realm, i, value[i]);
        }
        return;
      }

      //If value is RealmObject - manage it
      if (value is RealmObject && !value.isManaged) {
        object.realm.add<RealmObject>(value);
      }

      realmCore.setProperty(object, propertyMeta.key, value, isDefault);
    } on Exception catch (e) {
      throw RealmException("Error setting property ${metadata.classMeta.type}.$name Error: $e");
    }
  }
}

mixin RealmEntity {
  Realm? _realm;

  /// The [Realm] instance this object belongs to.
  Realm get realm => _realm ?? (throw RealmStateError('$this not managed'));

  /// True if the object belongs to a realm.
  bool get isManaged => _realm != null;
}

extension RealmEntityInternal on RealmEntity {
  void setRealm(Realm value) => _realm = value;
}

/// An object that is persisted in `Realm`.
///
/// `RealmObjects` are generated from Realm data model classes marked with `@RealmModel` annotation and named with an underscore.
///
/// A data model class `_MyClass` will have a `RealmObject` generated with name `MyClass`.
///
/// [RealmObject] should not be used directly as it is part of the generated class hierarchy. ex: `MyClass extends _MyClass with RealmObject`.
/// {@category Realm}
mixin RealmObject on RealmEntity {
  RealmObjectHandle? _handle;
  RealmAccessor _accessor = RealmValuesAccessor();

  Map<String, ValueProperty> get properties;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RealmObject) return false;
    if (!isManaged || !other.isManaged) return false;
    return realmCore.objectEquals(this, other);
  }

  /// Gets a value indicating whether this object is managed and represents a row in the database.
  ///
  /// If a managed object has been removed from the [Realm], it is no longer valid and accessing properties on it
  /// will throw an exception.
  /// The Object is not valid if its [Realm] is closed or object is deleted.
  /// Unmanaged objects are always considered valid.
  bool get isValid => isManaged ? realmCore.objectIsValid(this) : true;

  /// Allows listening for property changes on this Realm object
  ///
  /// Returns a [Stream] of [RealmObjectChanges<T>] that can be listened to.
  ///
  /// If the object is not managed a [RealmStateError] is thrown.
  Stream get changes => throw RealmError("Invalid usage. Use the generated inheritors of RealmObject");

  /// @nodoc
  static Stream<RealmObjectChanges<T>> getChanges<T extends RealmObject>(T object) {
    if (!object.isManaged) {
      throw RealmStateError("Object is not managed");
    }

    final controller = RealmObjectNotificationsController<T>(object);
    return controller.createStream();
  }
}

/// @nodoc
//RealmObject package internal members
extension RealmObjectInternal on RealmObject {
  void manage(Realm realm, RealmObjectHandle handle, RealmCoreAccessor accessor) {
    if (_handle != null) {
      //most certainly a bug hence we throw an Error
      throw ArgumentError("Object is already managed");
    }

    _handle = handle;
    _realm = realm;

    if (_accessor is RealmValuesAccessor) {
      (_accessor as RealmValuesAccessor).setAll(this, accessor);
    }

    _accessor = accessor;
  }

  static T create<T extends Object?>(Realm realm, RealmObjectHandle handle, RealmCoreAccessor accessor) {
    final schema = realm.config.schema.getByType<T>();
    final object = schema?.objectFactory();
    if (object is RealmObject) {
      object._handle = handle;
      object._accessor = accessor;
      object._realm = realm;
      return object;
    }
    throw RealmError('$T is not a RealmObject');
  }

  RealmObjectHandle get handle => _handle!;
  RealmAccessor get accessor => _accessor;
}

/// An exception being thrown when a `Realm` operation or [RealmObject] access fails.
/// {@category Realm}
class RealmException implements Exception {
  final String message;

  RealmException(this.message);

  @override
  String toString() {
    return "RealmException: $message";
  }
}

/// Describes the changes in on a single RealmObject since the last time the notification callback was invoked.
class RealmObjectChanges<T extends RealmObject> {
  // ignore: unused_field
  final RealmObjectChangesHandle _handle;

  /// The realm object being monitored for changes.
  final T object;

  /// `True` if the object was deleted.
  bool get isDeleted => realmCore.getObjectChangesIsDeleted(_handle);

  /// The property names that have changed.
  List<String> get properties {
    final propertyKeys = realmCore.getObjectChangesProperties(_handle);
    return object.realm.getPropertyNames(object.runtimeType, propertyKeys);
  }

  const RealmObjectChanges._(this._handle, this.object);
}

/// @nodoc
class RealmObjectNotificationsController<T extends RealmObject> extends NotificationsController {
  T realmObject;
  late final StreamController<RealmObjectChanges<T>> streamController;

  RealmObjectNotificationsController(this.realmObject);

  @override
  RealmNotificationTokenHandle subscribe() {
    return realmCore.subscribeObjectNotifications(realmObject, this);
  }

  Stream<RealmObjectChanges<T>> createStream() {
    streamController = StreamController<RealmObjectChanges<T>>(onListen: start, onPause: stop, onResume: start, onCancel: stop);
    return streamController.stream;
  }

  @override
  void onChanges(HandleBase changesHandle) {
    if (changesHandle is! RealmObjectChangesHandle) {
      throw RealmError("Invalid changes handle. RealmObjectChangesHandle expected");
    }

    final changes = RealmObjectChanges<T>._(changesHandle, realmObject);
    streamController.add(changes);
  }

  @override
  void onError(RealmError error) {
    streamController.addError(error);
  }
}
