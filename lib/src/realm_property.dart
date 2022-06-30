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

import 'package:realm_common/realm_common.dart';
import 'configuration.dart';
import 'realm_object.dart';
import 'list.dart';

bool isNullable<T>() => null is T;

Type ifNullableThenElse<T, TIf, TElse>() => isNullable<T>() ? TIf : TElse;

Type nullable<T>() => ifNullableThenElse<T, T, T?>();

/// Describes a [RealmObject]'s property with its name, type and other attributes in the [RealmSchema]
///{@category Configuration}
class ValueProperty<T extends Object?> {
  /// The name of the property as persisted in the [Realm]
  final String name;

  /// The [RealmPropertyType] of the property
  final RealmPropertyType propertyType;

  /// `true` if the property is a primary key.
  final bool primaryKey;

  /// Defines the [Realm] collection type if this property is a collection.
  final RealmCollectionType collectionType;

  /// Default value to use, if any
  final T? defaultValue;

  const ValueProperty(
    this.name,
    this.propertyType, {
    this.primaryKey = false,
    this.collectionType = RealmCollectionType.none,
    this.defaultValue,
  });

  /// [Type] of the property
  Type get type => T;

  /// `true` if the property is optional
  bool get optional => isNullable<T>() || defaultValue != null;

  T getValue<ParentT extends RealmObject>(ParentT object) {
    return (object.accessor.getValue(object, this) ?? defaultValue) as T;
  }

  void setValue(RealmObject object, T value) {
    object.accessor.set(object, this, value);
  }
}

class LinkTargetProperty<LinkT extends Object?, T extends Object?> extends ValueProperty<T> {
  const LinkTargetProperty(super.name, super.propertyType, {super.collectionType});

  /// Schema of the link target type
  SchemaObject? linkTarget(RealmSchema schema) => schema.getByType<LinkT>();
}

class ObjectProperty<LinkT extends RealmObject> extends LinkTargetProperty<LinkT, LinkT?> {
  const ObjectProperty(String name) : super(name, RealmPropertyType.object);

  @override
  LinkT? getValue<ParentT extends RealmObject>(ParentT object) {
    return object.accessor.getObject<LinkT>(object, this);
  }
}

class ListProperty<ElementT extends Object?> extends LinkTargetProperty<ElementT, RealmList<ElementT>> {
  const ListProperty(super.name, super.propertyType) : super(collectionType: RealmCollectionType.list);

  @override
  RealmList<ElementT> getValue<ParentT extends RealmObject>(ParentT object) {
    return object.accessor.getList<ElementT>(object, this);
  }
}
