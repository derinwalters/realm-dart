// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Car extends _Car with RealmEntity, RealmObject {
  Car(
    String make,
  ) {
    _makeProperty.setValue(this, make);
  }

  Car._();

  static const _makeProperty = ValueProperty<String>(
    'make',
    RealmPropertyType.string,
    primaryKey: true,
  );
  @override
  String get make => _makeProperty.getValue(this);
  @override
  set make(String value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Car>> get changes => RealmObject.getChanges(this);

  static const schema = SchemaObject<Car>(
    Car._,
    'Car',
    {
      'make': _makeProperty,
    },
    _makeProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class Person extends _Person with RealmEntity, RealmObject {
  Person(
    String name,
  ) {
    _nameProperty.setValue(this, name);
  }

  Person._();

  static const _nameProperty = ValueProperty<String>(
    'name',
    RealmPropertyType.string,
  );
  @override
  String get name => _nameProperty.getValue(this);
  @override
  set name(String value) => _nameProperty.setValue(this, value);

  @override
  Stream<RealmObjectChanges<Person>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<Person>(
    Person._,
    'Person',
    {
      'name': _nameProperty,
    },
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class Dog extends _Dog with RealmEntity, RealmObject {
  Dog(
    String name, {
    int? age,
    Person? owner,
  }) {
    _nameProperty.setValue(this, name);
    _ageProperty.setValue(this, age);
    _ownerProperty.setValue(this, owner);
  }

  Dog._();

  static const _nameProperty = ValueProperty<String>(
    'name',
    RealmPropertyType.string,
    primaryKey: true,
  );
  @override
  String get name => _nameProperty.getValue(this);
  @override
  set name(String value) => throw RealmUnsupportedSetError();

  static const _ageProperty = ValueProperty<int?>(
    'age',
    RealmPropertyType.int,
  );
  @override
  int? get age => _ageProperty.getValue(this);
  @override
  set age(int? value) => _ageProperty.setValue(this, value);

  static const _ownerProperty = ObjectProperty<Person>('owner');
  @override
  Person? get owner => _ownerProperty.getValue(this);
  @override
  set owner(covariant Person? value) => _ownerProperty.setValue(this, value);

  @override
  Stream<RealmObjectChanges<Dog>> get changes => RealmObject.getChanges(this);

  static const schema = SchemaObject<Dog>(
    Dog._,
    'Dog',
    {
      'name': _nameProperty,
      'age': _ageProperty,
      'owner': _ownerProperty,
    },
    _nameProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class Team extends _Team with RealmEntity, RealmObject {
  Team(
    String name, {
    Iterable<Person> players = const [],
    Iterable<int> scores = const [],
  }) {
    _nameProperty.setValue(this, name);
    _playersProperty.setValue(this, RealmList<Person>(players));
    _scoresProperty.setValue(this, RealmList<int>(scores));
  }

  Team._();

  static const _nameProperty = ValueProperty<String>(
    'name',
    RealmPropertyType.string,
  );
  @override
  String get name => _nameProperty.getValue(this);
  @override
  set name(String value) => _nameProperty.setValue(this, value);

  static const _playersProperty =
      ListProperty<Person>('players', RealmPropertyType.object);
  @override
  RealmList<Person> get players => _playersProperty.getValue(this);
  @override
  set players(covariant RealmList<Person> value) =>
      throw RealmUnsupportedSetError();

  static const _scoresProperty =
      ListProperty<int>('scores', RealmPropertyType.int);
  @override
  RealmList<int> get scores => _scoresProperty.getValue(this);
  @override
  set scores(covariant RealmList<int> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Team>> get changes => RealmObject.getChanges(this);

  static const schema = SchemaObject<Team>(
    Team._,
    'Team',
    {
      'name': _nameProperty,
      'players': _playersProperty,
      'scores': _scoresProperty,
    },
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class Student extends _Student with RealmEntity, RealmObject {
  Student(
    int number, {
    String? name,
    int? yearOfBirth,
    School? school,
  }) {
    _numberProperty.setValue(this, number);
    _nameProperty.setValue(this, name);
    _yearOfBirthProperty.setValue(this, yearOfBirth);
    _schoolProperty.setValue(this, school);
  }

  Student._();

  static const _numberProperty = ValueProperty<int>(
    'number',
    RealmPropertyType.int,
    primaryKey: true,
  );
  @override
  int get number => _numberProperty.getValue(this);
  @override
  set number(int value) => throw RealmUnsupportedSetError();

  static const _nameProperty = ValueProperty<String?>(
    'name',
    RealmPropertyType.string,
  );
  @override
  String? get name => _nameProperty.getValue(this);
  @override
  set name(String? value) => _nameProperty.setValue(this, value);

  static const _yearOfBirthProperty = ValueProperty<int?>(
    'yearOfBirth',
    RealmPropertyType.int,
  );
  @override
  int? get yearOfBirth => _yearOfBirthProperty.getValue(this);
  @override
  set yearOfBirth(int? value) => _yearOfBirthProperty.setValue(this, value);

  static const _schoolProperty = ObjectProperty<School>('school');
  @override
  School? get school => _schoolProperty.getValue(this);
  @override
  set school(covariant School? value) => _schoolProperty.setValue(this, value);

  @override
  Stream<RealmObjectChanges<Student>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<Student>(
    Student._,
    'Student',
    {
      'number': _numberProperty,
      'name': _nameProperty,
      'yearOfBirth': _yearOfBirthProperty,
      'school': _schoolProperty,
    },
    _numberProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class School extends _School with RealmEntity, RealmObject {
  School(
    String name, {
    String? city,
    School? branchOfSchool,
    Iterable<Student> students = const [],
    Iterable<School> branches = const [],
  }) {
    _nameProperty.setValue(this, name);
    _cityProperty.setValue(this, city);
    _branchOfSchoolProperty.setValue(this, branchOfSchool);
    _studentsProperty.setValue(this, RealmList<Student>(students));
    _branchesProperty.setValue(this, RealmList<School>(branches));
  }

  School._();

  static const _nameProperty = ValueProperty<String>(
    'name',
    RealmPropertyType.string,
    primaryKey: true,
  );
  @override
  String get name => _nameProperty.getValue(this);
  @override
  set name(String value) => throw RealmUnsupportedSetError();

  static const _cityProperty = ValueProperty<String?>(
    'city',
    RealmPropertyType.string,
  );
  @override
  String? get city => _cityProperty.getValue(this);
  @override
  set city(String? value) => _cityProperty.setValue(this, value);

  static const _studentsProperty =
      ListProperty<Student>('students', RealmPropertyType.object);
  @override
  RealmList<Student> get students => _studentsProperty.getValue(this);
  @override
  set students(covariant RealmList<Student> value) =>
      throw RealmUnsupportedSetError();

  static const _branchOfSchoolProperty =
      ObjectProperty<School>('branchOfSchool');
  @override
  School? get branchOfSchool => _branchOfSchoolProperty.getValue(this);
  @override
  set branchOfSchool(covariant School? value) =>
      _branchOfSchoolProperty.setValue(this, value);

  static const _branchesProperty =
      ListProperty<School>('branches', RealmPropertyType.object);
  @override
  RealmList<School> get branches => _branchesProperty.getValue(this);
  @override
  set branches(covariant RealmList<School> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<School>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<School>(
    School._,
    'School',
    {
      'name': _nameProperty,
      'city': _cityProperty,
      'students': _studentsProperty,
      'branchOfSchool': _branchOfSchoolProperty,
      'branches': _branchesProperty,
    },
    _nameProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class RemappedClass extends $RemappedClass with RealmEntity, RealmObject {
  RemappedClass(
    String remappedProperty, {
    Iterable<RemappedClass> listProperty = const [],
  }) {
    _remappedPropertyProperty.setValue(this, remappedProperty);
    _listPropertyProperty.setValue(
        this, RealmList<RemappedClass>(listProperty));
  }

  RemappedClass._();

  static const _remappedPropertyProperty = ValueProperty<String>(
    'primitive_property',
    RealmPropertyType.string,
  );
  @override
  String get remappedProperty => _remappedPropertyProperty.getValue(this);
  @override
  set remappedProperty(String value) =>
      _remappedPropertyProperty.setValue(this, value);

  static const _listPropertyProperty =
      ListProperty<RemappedClass>('list-with-dashes', RealmPropertyType.object);
  @override
  RealmList<RemappedClass> get listProperty =>
      _listPropertyProperty.getValue(this);
  @override
  set listProperty(covariant RealmList<RemappedClass> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<RemappedClass>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<RemappedClass>(
    RemappedClass._,
    'myRemappedClass',
    {
      'primitive_property': _remappedPropertyProperty,
      'list-with-dashes': _listPropertyProperty,
    },
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class Task extends _Task with RealmEntity, RealmObject {
  Task(
    ObjectId id,
  ) {
    _idProperty.setValue(this, id);
  }

  Task._();

  static const _idProperty = ValueProperty<ObjectId>(
    '_id',
    RealmPropertyType.objectid,
    primaryKey: true,
  );
  @override
  ObjectId get id => _idProperty.getValue(this);
  @override
  set id(ObjectId value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Task>> get changes => RealmObject.getChanges(this);

  static const schema = SchemaObject<Task>(
    Task._,
    'Task',
    {
      '_id': _idProperty,
    },
    _idProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class Schedule extends _Schedule with RealmEntity, RealmObject {
  Schedule(
    ObjectId id, {
    Iterable<Task> tasks = const [],
  }) {
    _idProperty.setValue(this, id);
    _tasksProperty.setValue(this, RealmList<Task>(tasks));
  }

  Schedule._();

  static const _idProperty = ValueProperty<ObjectId>(
    '_id',
    RealmPropertyType.objectid,
    primaryKey: true,
  );
  @override
  ObjectId get id => _idProperty.getValue(this);
  @override
  set id(ObjectId value) => throw RealmUnsupportedSetError();

  static const _tasksProperty =
      ListProperty<Task>('tasks', RealmPropertyType.object);
  @override
  RealmList<Task> get tasks => _tasksProperty.getValue(this);
  @override
  set tasks(covariant RealmList<Task> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Schedule>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<Schedule>(
    Schedule._,
    'Schedule',
    {
      '_id': _idProperty,
      'tasks': _tasksProperty,
    },
    _idProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class AllTypes extends _AllTypes with RealmEntity, RealmObject {
  AllTypes(
    String stringProp,
    bool boolProp,
    DateTime dateProp,
    double doubleProp,
    ObjectId objectIdProp,
    Uuid uuidProp,
    int intProp,
  ) {
    _stringPropProperty.setValue(this, stringProp);
    _boolPropProperty.setValue(this, boolProp);
    _datePropProperty.setValue(this, dateProp);
    _doublePropProperty.setValue(this, doubleProp);
    _objectIdPropProperty.setValue(this, objectIdProp);
    _uuidPropProperty.setValue(this, uuidProp);
    _intPropProperty.setValue(this, intProp);
  }

  AllTypes._();

  static const _stringPropProperty = ValueProperty<String>(
    'stringProp',
    RealmPropertyType.string,
  );
  @override
  String get stringProp => _stringPropProperty.getValue(this);
  @override
  set stringProp(String value) => _stringPropProperty.setValue(this, value);

  static const _boolPropProperty = ValueProperty<bool>(
    'boolProp',
    RealmPropertyType.bool,
  );
  @override
  bool get boolProp => _boolPropProperty.getValue(this);
  @override
  set boolProp(bool value) => _boolPropProperty.setValue(this, value);

  static const _datePropProperty = ValueProperty<DateTime>(
    'dateProp',
    RealmPropertyType.timestamp,
  );
  @override
  DateTime get dateProp => _datePropProperty.getValue(this);
  @override
  set dateProp(DateTime value) => _datePropProperty.setValue(this, value);

  static const _doublePropProperty = ValueProperty<double>(
    'doubleProp',
    RealmPropertyType.double,
  );
  @override
  double get doubleProp => _doublePropProperty.getValue(this);
  @override
  set doubleProp(double value) => _doublePropProperty.setValue(this, value);

  static const _objectIdPropProperty = ValueProperty<ObjectId>(
    'objectIdProp',
    RealmPropertyType.objectid,
  );
  @override
  ObjectId get objectIdProp => _objectIdPropProperty.getValue(this);
  @override
  set objectIdProp(ObjectId value) =>
      _objectIdPropProperty.setValue(this, value);

  static const _uuidPropProperty = ValueProperty<Uuid>(
    'uuidProp',
    RealmPropertyType.uuid,
  );
  @override
  Uuid get uuidProp => _uuidPropProperty.getValue(this);
  @override
  set uuidProp(Uuid value) => _uuidPropProperty.setValue(this, value);

  static const _intPropProperty = ValueProperty<int>(
    'intProp',
    RealmPropertyType.int,
  );
  @override
  int get intProp => _intPropProperty.getValue(this);
  @override
  set intProp(int value) => _intPropProperty.setValue(this, value);

  @override
  Stream<RealmObjectChanges<AllTypes>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<AllTypes>(
    AllTypes._,
    'AllTypes',
    {
      'stringProp': _stringPropProperty,
      'boolProp': _boolPropProperty,
      'dateProp': _datePropProperty,
      'doubleProp': _doublePropProperty,
      'objectIdProp': _objectIdPropProperty,
      'uuidProp': _uuidPropProperty,
      'intProp': _intPropProperty,
    },
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class AllCollections extends _AllCollections with RealmEntity, RealmObject {
  AllCollections({
    Iterable<String> strings = const [],
    Iterable<bool> bools = const [],
    Iterable<DateTime> dates = const [],
    Iterable<double> doubles = const [],
    Iterable<ObjectId> objectIds = const [],
    Iterable<Uuid> uuids = const [],
    Iterable<int> ints = const [],
  }) {
    _stringsProperty.setValue(this, RealmList<String>(strings));
    _boolsProperty.setValue(this, RealmList<bool>(bools));
    _datesProperty.setValue(this, RealmList<DateTime>(dates));
    _doublesProperty.setValue(this, RealmList<double>(doubles));
    _objectIdsProperty.setValue(this, RealmList<ObjectId>(objectIds));
    _uuidsProperty.setValue(this, RealmList<Uuid>(uuids));
    _intsProperty.setValue(this, RealmList<int>(ints));
  }

  AllCollections._();

  static const _stringsProperty =
      ListProperty<String>('strings', RealmPropertyType.string);
  @override
  RealmList<String> get strings => _stringsProperty.getValue(this);
  @override
  set strings(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  static const _boolsProperty =
      ListProperty<bool>('bools', RealmPropertyType.bool);
  @override
  RealmList<bool> get bools => _boolsProperty.getValue(this);
  @override
  set bools(covariant RealmList<bool> value) =>
      throw RealmUnsupportedSetError();

  static const _datesProperty =
      ListProperty<DateTime>('dates', RealmPropertyType.timestamp);
  @override
  RealmList<DateTime> get dates => _datesProperty.getValue(this);
  @override
  set dates(covariant RealmList<DateTime> value) =>
      throw RealmUnsupportedSetError();

  static const _doublesProperty =
      ListProperty<double>('doubles', RealmPropertyType.double);
  @override
  RealmList<double> get doubles => _doublesProperty.getValue(this);
  @override
  set doubles(covariant RealmList<double> value) =>
      throw RealmUnsupportedSetError();

  static const _objectIdsProperty =
      ListProperty<ObjectId>('objectIds', RealmPropertyType.objectid);
  @override
  RealmList<ObjectId> get objectIds => _objectIdsProperty.getValue(this);
  @override
  set objectIds(covariant RealmList<ObjectId> value) =>
      throw RealmUnsupportedSetError();

  static const _uuidsProperty =
      ListProperty<Uuid>('uuids', RealmPropertyType.uuid);
  @override
  RealmList<Uuid> get uuids => _uuidsProperty.getValue(this);
  @override
  set uuids(covariant RealmList<Uuid> value) =>
      throw RealmUnsupportedSetError();

  static const _intsProperty = ListProperty<int>('ints', RealmPropertyType.int);
  @override
  RealmList<int> get ints => _intsProperty.getValue(this);
  @override
  set ints(covariant RealmList<int> value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<AllCollections>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<AllCollections>(
    AllCollections._,
    'AllCollections',
    {
      'strings': _stringsProperty,
      'bools': _boolsProperty,
      'dates': _datesProperty,
      'doubles': _doublesProperty,
      'objectIds': _objectIdsProperty,
      'uuids': _uuidsProperty,
      'ints': _intsProperty,
    },
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class NullableTypes extends _NullableTypes with RealmEntity, RealmObject {
  NullableTypes(
    ObjectId id,
    ObjectId differentiator, {
    String? stringProp,
    bool? boolProp,
    DateTime? dateProp,
    double? doubleProp,
    ObjectId? objectIdProp,
    Uuid? uuidProp,
    int? intProp,
    Iterable<double?> intsProp = const [],
  }) {
    _idProperty.setValue(this, id);
    _differentiatorProperty.setValue(this, differentiator);
    _stringPropProperty.setValue(this, stringProp);
    _boolPropProperty.setValue(this, boolProp);
    _datePropProperty.setValue(this, dateProp);
    _doublePropProperty.setValue(this, doubleProp);
    _objectIdPropProperty.setValue(this, objectIdProp);
    _uuidPropProperty.setValue(this, uuidProp);
    _intPropProperty.setValue(this, intProp);
    _intsPropProperty.setValue(this, RealmList<double?>(intsProp));
  }

  NullableTypes._();

  static const _idProperty = ValueProperty<ObjectId>(
    '_id',
    RealmPropertyType.objectid,
    primaryKey: true,
  );
  @override
  ObjectId get id => _idProperty.getValue(this);
  @override
  set id(ObjectId value) => throw RealmUnsupportedSetError();

  static const _differentiatorProperty = ValueProperty<ObjectId>(
    'differentiator',
    RealmPropertyType.objectid,
  );
  @override
  ObjectId get differentiator => _differentiatorProperty.getValue(this);
  @override
  set differentiator(ObjectId value) =>
      _differentiatorProperty.setValue(this, value);

  static const _stringPropProperty = ValueProperty<String?>(
    'stringProp',
    RealmPropertyType.string,
  );
  @override
  String? get stringProp => _stringPropProperty.getValue(this);
  @override
  set stringProp(String? value) => _stringPropProperty.setValue(this, value);

  static const _boolPropProperty = ValueProperty<bool?>(
    'boolProp',
    RealmPropertyType.bool,
  );
  @override
  bool? get boolProp => _boolPropProperty.getValue(this);
  @override
  set boolProp(bool? value) => _boolPropProperty.setValue(this, value);

  static const _datePropProperty = ValueProperty<DateTime?>(
    'dateProp',
    RealmPropertyType.timestamp,
  );
  @override
  DateTime? get dateProp => _datePropProperty.getValue(this);
  @override
  set dateProp(DateTime? value) => _datePropProperty.setValue(this, value);

  static const _doublePropProperty = ValueProperty<double?>(
    'doubleProp',
    RealmPropertyType.double,
  );
  @override
  double? get doubleProp => _doublePropProperty.getValue(this);
  @override
  set doubleProp(double? value) => _doublePropProperty.setValue(this, value);

  static const _objectIdPropProperty = ValueProperty<ObjectId?>(
    'objectIdProp',
    RealmPropertyType.objectid,
  );
  @override
  ObjectId? get objectIdProp => _objectIdPropProperty.getValue(this);
  @override
  set objectIdProp(ObjectId? value) =>
      _objectIdPropProperty.setValue(this, value);

  static const _uuidPropProperty = ValueProperty<Uuid?>(
    'uuidProp',
    RealmPropertyType.uuid,
  );
  @override
  Uuid? get uuidProp => _uuidPropProperty.getValue(this);
  @override
  set uuidProp(Uuid? value) => _uuidPropProperty.setValue(this, value);

  static const _intPropProperty = ValueProperty<int?>(
    'intProp',
    RealmPropertyType.int,
  );
  @override
  int? get intProp => _intPropProperty.getValue(this);
  @override
  set intProp(int? value) => _intPropProperty.setValue(this, value);

  static const _intsPropProperty =
      ListProperty<double?>('intsProp', RealmPropertyType.double);
  @override
  RealmList<double?> get intsProp => _intsPropProperty.getValue(this);
  @override
  set intsProp(covariant RealmList<double?> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<NullableTypes>> get changes =>
      RealmObject.getChanges(this);

  static const schema = SchemaObject<NullableTypes>(
    NullableTypes._,
    'NullableTypes',
    {
      '_id': _idProperty,
      'differentiator': _differentiatorProperty,
      'stringProp': _stringPropProperty,
      'boolProp': _boolPropProperty,
      'dateProp': _datePropProperty,
      'doubleProp': _doublePropProperty,
      'objectIdProp': _objectIdPropProperty,
      'uuidProp': _uuidPropProperty,
      'intProp': _intPropProperty,
      'intsProp': _intsPropProperty,
    },
    _idProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}

class Event extends _Event with RealmEntity, RealmObject {
  Event(
    ObjectId id, {
    String? name,
    bool? isCompleted,
    int? durationInMinutes,
    String? assignedTo,
  }) {
    _idProperty.setValue(this, id);
    _nameProperty.setValue(this, name);
    _isCompletedProperty.setValue(this, isCompleted);
    _durationInMinutesProperty.setValue(this, durationInMinutes);
    _assignedToProperty.setValue(this, assignedTo);
  }

  Event._();

  static const _idProperty = ValueProperty<ObjectId>(
    '_id',
    RealmPropertyType.objectid,
    primaryKey: true,
  );
  @override
  ObjectId get id => _idProperty.getValue(this);
  @override
  set id(ObjectId value) => throw RealmUnsupportedSetError();

  static const _nameProperty = ValueProperty<String?>(
    'stringQueryField',
    RealmPropertyType.string,
  );
  @override
  String? get name => _nameProperty.getValue(this);
  @override
  set name(String? value) => _nameProperty.setValue(this, value);

  static const _isCompletedProperty = ValueProperty<bool?>(
    'boolQueryField',
    RealmPropertyType.bool,
  );
  @override
  bool? get isCompleted => _isCompletedProperty.getValue(this);
  @override
  set isCompleted(bool? value) => _isCompletedProperty.setValue(this, value);

  static const _durationInMinutesProperty = ValueProperty<int?>(
    'intQueryField',
    RealmPropertyType.int,
  );
  @override
  int? get durationInMinutes => _durationInMinutesProperty.getValue(this);
  @override
  set durationInMinutes(int? value) =>
      _durationInMinutesProperty.setValue(this, value);

  static const _assignedToProperty = ValueProperty<String?>(
    'assignedTo',
    RealmPropertyType.string,
  );
  @override
  String? get assignedTo => _assignedToProperty.getValue(this);
  @override
  set assignedTo(String? value) => _assignedToProperty.setValue(this, value);

  @override
  Stream<RealmObjectChanges<Event>> get changes => RealmObject.getChanges(this);

  static const schema = SchemaObject<Event>(
    Event._,
    'Event',
    {
      '_id': _idProperty,
      'stringQueryField': _nameProperty,
      'boolQueryField': _isCompletedProperty,
      'intQueryField': _durationInMinutesProperty,
      'assignedTo': _assignedToProperty,
    },
    _idProperty,
  );
  @override
  Map<String, ValueProperty> get properties => schema.properties;
}
