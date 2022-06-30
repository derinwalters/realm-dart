// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_object_test.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ObjectIdPrimaryKey extends _ObjectIdPrimaryKey
    with RealmEntity, RealmObject {
  ObjectIdPrimaryKey(
    ObjectId id,
  ) {
    _idProperty.setValue(this, id);
  }

  ObjectIdPrimaryKey._();

  static const _idProperty = ValueProperty<ObjectId>(
    'id',
    RealmPropertyType.objectid,
    primaryKey: true,
  );
  @override
  ObjectId get id => _idProperty.getValue(this);
  @override
  set id(ObjectId value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ObjectIdPrimaryKey>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<ObjectIdPrimaryKey>(
    ObjectIdPrimaryKey._,
    'ObjectIdPrimaryKey',
    {
      'id': _idProperty,
    },
    _idProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class IntPrimaryKey extends _IntPrimaryKey with RealmEntity, RealmObject {
  IntPrimaryKey(
    int id,
  ) {
    _idProperty.setValue(this, id);
  }

  IntPrimaryKey._();

  static const _idProperty = ValueProperty<int>(
    'id',
    RealmPropertyType.int,
    primaryKey: true,
  );
  @override
  int get id => _idProperty.getValue(this);
  @override
  set id(int value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<IntPrimaryKey>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<IntPrimaryKey>(
    IntPrimaryKey._,
    'IntPrimaryKey',
    {
      'id': _idProperty,
    },
    _idProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class StringPrimaryKey extends _StringPrimaryKey with RealmEntity, RealmObject {
  StringPrimaryKey(
    String id,
  ) {
    _idProperty.setValue(this, id);
  }

  StringPrimaryKey._();

  static const _idProperty = ValueProperty<String>(
    'id',
    RealmPropertyType.string,
    primaryKey: true,
  );
  @override
  String get id => _idProperty.getValue(this);
  @override
  set id(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<StringPrimaryKey>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<StringPrimaryKey>(
    StringPrimaryKey._,
    'StringPrimaryKey',
    {
      'id': _idProperty,
    },
    _idProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class UuidPrimaryKey extends _UuidPrimaryKey with RealmEntity, RealmObject {
  UuidPrimaryKey(
    Uuid id,
  ) {
    _idProperty.setValue(this, id);
  }

  UuidPrimaryKey._();

  static const _idProperty = ValueProperty<Uuid>(
    'id',
    RealmPropertyType.uuid,
    primaryKey: true,
  );
  @override
  Uuid get id => _idProperty.getValue(this);
  @override
  set id(Uuid value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<UuidPrimaryKey>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<UuidPrimaryKey>(
    UuidPrimaryKey._,
    'UuidPrimaryKey',
    {
      'id': _idProperty,
    },
    _idProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class RemappedFromAnotherFile extends _RemappedFromAnotherFile
    with RealmEntity, RealmObject {
  RemappedFromAnotherFile({
    RemappedClass? linkToAnotherClass,
  }) {
    _linkToAnotherClassProperty.setValue(this, linkToAnotherClass);
  }

  RemappedFromAnotherFile._();

  static const _linkToAnotherClassProperty =
      ObjectProperty<RemappedClass>('property with spaces');
  @override
  RemappedClass? get linkToAnotherClass =>
      _linkToAnotherClassProperty.getValue(this);
  @override
  set linkToAnotherClass(covariant RemappedClass? value) =>
      _linkToAnotherClassProperty.setValue(this, value);

  @override
  Stream<RealmObjectChanges<RemappedFromAnotherFile>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<RemappedFromAnotherFile>(
    RemappedFromAnotherFile._,
    'class with spaces',
    {
      'property with spaces': _linkToAnotherClassProperty,
    },
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class BoolValue extends _BoolValue with RealmEntity, RealmObject {
  BoolValue(
    int key,
    bool value,
  ) {
    _keyProperty.setValue(this, key);
    _valueProperty.setValue(this, value);
  }

  BoolValue._();

  static const _keyProperty = ValueProperty<int>(
    'key',
    RealmPropertyType.int,
    primaryKey: true,
  );
  @override
  int get key => _keyProperty.getValue(this);
  @override
  set key(int value) => throw RealmUnsupportedSetError();

  static const _valueProperty = ValueProperty<bool>(
    'value',
    RealmPropertyType.bool,
  );
  @override
  bool get value => _valueProperty.getValue(this);
  @override
  set value(bool value) => _valueProperty.setValue(this, value);

  @override
  Stream<RealmObjectChanges<BoolValue>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<BoolValue>(
    BoolValue._,
    'BoolValue',
    {
      'key': _keyProperty,
      'value': _valueProperty,
    },
    _keyProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}
