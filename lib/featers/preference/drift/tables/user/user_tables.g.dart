// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tables.dart';

// ignore_for_file: type=lint
class $UserItemsTable extends UserItems
    with TableInfo<$UserItemsTable, UserItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
      'date_of_birth', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _mailMeta = const VerificationMeta('mail');
  @override
  late final GeneratedColumn<String> mail = GeneratedColumn<String>(
      'mail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, lastName, dateOfBirth, password, mail, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_items';
  @override
  VerificationContext validateIntegrity(Insertable<UserItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('mail')) {
      context.handle(
          _mailMeta, mail.isAcceptableOrUnknown(data['mail']!, _mailMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      dateOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_of_birth']),
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      mail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mail']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $UserItemsTable createAlias(String alias) {
    return $UserItemsTable(attachedDatabase, alias);
  }
}

class UserItem extends DataClass implements Insertable<UserItem> {
  final int id;
  final String name;
  final String? lastName;
  final String? dateOfBirth;
  final String password;
  final String? mail;
  final DateTime? createdAt;
  const UserItem(
      {required this.id,
      required this.name,
      this.lastName,
      this.dateOfBirth,
      required this.password,
      this.mail,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['date_of_birth'] = Variable<String>(dateOfBirth);
    }
    map['password'] = Variable<String>(password);
    if (!nullToAbsent || mail != null) {
      map['mail'] = Variable<String>(mail);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  UserItemsCompanion toCompanion(bool nullToAbsent) {
    return UserItemsCompanion(
      id: Value(id),
      name: Value(name),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      password: Value(password),
      mail: mail == null && nullToAbsent ? const Value.absent() : Value(mail),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory UserItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      dateOfBirth: serializer.fromJson<String?>(json['dateOfBirth']),
      password: serializer.fromJson<String>(json['password']),
      mail: serializer.fromJson<String?>(json['mail']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lastName': serializer.toJson<String?>(lastName),
      'dateOfBirth': serializer.toJson<String?>(dateOfBirth),
      'password': serializer.toJson<String>(password),
      'mail': serializer.toJson<String?>(mail),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  UserItem copyWith(
          {int? id,
          String? name,
          Value<String?> lastName = const Value.absent(),
          Value<String?> dateOfBirth = const Value.absent(),
          String? password,
          Value<String?> mail = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent()}) =>
      UserItem(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName.present ? lastName.value : this.lastName,
        dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
        password: password ?? this.password,
        mail: mail.present ? mail.value : this.mail,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  UserItem copyWithCompanion(UserItemsCompanion data) {
    return UserItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      password: data.password.present ? data.password.value : this.password,
      mail: data.mail.present ? data.mail.value : this.mail,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('password: $password, ')
          ..write('mail: $mail, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, lastName, dateOfBirth, password, mail, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.lastName == this.lastName &&
          other.dateOfBirth == this.dateOfBirth &&
          other.password == this.password &&
          other.mail == this.mail &&
          other.createdAt == this.createdAt);
}

class UserItemsCompanion extends UpdateCompanion<UserItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> lastName;
  final Value<String?> dateOfBirth;
  final Value<String> password;
  final Value<String?> mail;
  final Value<DateTime?> createdAt;
  const UserItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.password = const Value.absent(),
    this.mail = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UserItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.lastName = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    required String password,
    this.mail = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        password = Value(password);
  static Insertable<UserItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? lastName,
    Expression<String>? dateOfBirth,
    Expression<String>? password,
    Expression<String>? mail,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lastName != null) 'last_name': lastName,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (password != null) 'password': password,
      if (mail != null) 'mail': mail,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UserItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? lastName,
      Value<String?>? dateOfBirth,
      Value<String>? password,
      Value<String?>? mail,
      Value<DateTime?>? createdAt}) {
    return UserItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      password: password ?? this.password,
      mail: mail ?? this.mail,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<String>(dateOfBirth.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (mail.present) {
      map['mail'] = Variable<String>(mail.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('password: $password, ')
          ..write('mail: $mail, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserItemsTable userItems = $UserItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userItems];
}

typedef $$UserItemsTableCreateCompanionBuilder = UserItemsCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> lastName,
  Value<String?> dateOfBirth,
  required String password,
  Value<String?> mail,
  Value<DateTime?> createdAt,
});
typedef $$UserItemsTableUpdateCompanionBuilder = UserItemsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> lastName,
  Value<String?> dateOfBirth,
  Value<String> password,
  Value<String?> mail,
  Value<DateTime?> createdAt,
});

class $$UserItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserItemsTable> {
  $$UserItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get dateOfBirth => $state.composableBuilder(
      column: $state.table.dateOfBirth,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get mail => $state.composableBuilder(
      column: $state.table.mail,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserItemsTable> {
  $$UserItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get dateOfBirth => $state.composableBuilder(
      column: $state.table.dateOfBirth,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get mail => $state.composableBuilder(
      column: $state.table.mail,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UserItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserItemsTable,
    UserItem,
    $$UserItemsTableFilterComposer,
    $$UserItemsTableOrderingComposer,
    $$UserItemsTableCreateCompanionBuilder,
    $$UserItemsTableUpdateCompanionBuilder,
    (UserItem, BaseReferences<_$AppDatabase, $UserItemsTable, UserItem>),
    UserItem,
    PrefetchHooks Function()> {
  $$UserItemsTableTableManager(_$AppDatabase db, $UserItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> dateOfBirth = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String?> mail = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              UserItemsCompanion(
            id: id,
            name: name,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
            password: password,
            mail: mail,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> lastName = const Value.absent(),
            Value<String?> dateOfBirth = const Value.absent(),
            required String password,
            Value<String?> mail = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              UserItemsCompanion.insert(
            id: id,
            name: name,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
            password: password,
            mail: mail,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserItemsTable,
    UserItem,
    $$UserItemsTableFilterComposer,
    $$UserItemsTableOrderingComposer,
    $$UserItemsTableCreateCompanionBuilder,
    $$UserItemsTableUpdateCompanionBuilder,
    (UserItem, BaseReferences<_$AppDatabase, $UserItemsTable, UserItem>),
    UserItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserItemsTableTableManager get userItems =>
      $$UserItemsTableTableManager(_db, _db.userItems);
}
