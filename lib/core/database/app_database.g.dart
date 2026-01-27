// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AddressTableTable extends AddressTable
    with TableInfo<$AddressTableTable, AddressTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddressTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _zipCodeMeta =
      const VerificationMeta('zipCode');
  @override
  late final GeneratedColumn<String> zipCode = GeneratedColumn<String>(
      'zip_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, street, city, zipCode, phoneNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'address_table';
  @override
  VerificationContext validateIntegrity(Insertable<AddressTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('zip_code')) {
      context.handle(_zipCodeMeta,
          zipCode.isAcceptableOrUnknown(data['zip_code']!, _zipCodeMeta));
    } else if (isInserting) {
      context.missing(_zipCodeMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AddressTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AddressTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      zipCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zip_code'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
    );
  }

  @override
  $AddressTableTable createAlias(String alias) {
    return $AddressTableTable(attachedDatabase, alias);
  }
}

class AddressTableData extends DataClass
    implements Insertable<AddressTableData> {
  final String id;
  final String name;
  final String street;
  final String city;
  final String zipCode;
  final String phoneNumber;
  const AddressTableData(
      {required this.id,
      required this.name,
      required this.street,
      required this.city,
      required this.zipCode,
      required this.phoneNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['street'] = Variable<String>(street);
    map['city'] = Variable<String>(city);
    map['zip_code'] = Variable<String>(zipCode);
    map['phone_number'] = Variable<String>(phoneNumber);
    return map;
  }

  AddressTableCompanion toCompanion(bool nullToAbsent) {
    return AddressTableCompanion(
      id: Value(id),
      name: Value(name),
      street: Value(street),
      city: Value(city),
      zipCode: Value(zipCode),
      phoneNumber: Value(phoneNumber),
    );
  }

  factory AddressTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AddressTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      street: serializer.fromJson<String>(json['street']),
      city: serializer.fromJson<String>(json['city']),
      zipCode: serializer.fromJson<String>(json['zipCode']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'street': serializer.toJson<String>(street),
      'city': serializer.toJson<String>(city),
      'zipCode': serializer.toJson<String>(zipCode),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
    };
  }

  AddressTableData copyWith(
          {String? id,
          String? name,
          String? street,
          String? city,
          String? zipCode,
          String? phoneNumber}) =>
      AddressTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        street: street ?? this.street,
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
  AddressTableData copyWithCompanion(AddressTableCompanion data) {
    return AddressTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      street: data.street.present ? data.street.value : this.street,
      city: data.city.present ? data.city.value : this.city,
      zipCode: data.zipCode.present ? data.zipCode.value : this.zipCode,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AddressTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('street: $street, ')
          ..write('city: $city, ')
          ..write('zipCode: $zipCode, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, street, city, zipCode, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddressTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.street == this.street &&
          other.city == this.city &&
          other.zipCode == this.zipCode &&
          other.phoneNumber == this.phoneNumber);
}

class AddressTableCompanion extends UpdateCompanion<AddressTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> street;
  final Value<String> city;
  final Value<String> zipCode;
  final Value<String> phoneNumber;
  final Value<int> rowid;
  const AddressTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.street = const Value.absent(),
    this.city = const Value.absent(),
    this.zipCode = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AddressTableCompanion.insert({
    required String id,
    required String name,
    required String street,
    required String city,
    required String zipCode,
    required String phoneNumber,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        street = Value(street),
        city = Value(city),
        zipCode = Value(zipCode),
        phoneNumber = Value(phoneNumber);
  static Insertable<AddressTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? street,
    Expression<String>? city,
    Expression<String>? zipCode,
    Expression<String>? phoneNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (street != null) 'street': street,
      if (city != null) 'city': city,
      if (zipCode != null) 'zip_code': zipCode,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AddressTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? street,
      Value<String>? city,
      Value<String>? zipCode,
      Value<String>? phoneNumber,
      Value<int>? rowid}) {
    return AddressTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      street: street ?? this.street,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (zipCode.present) {
      map['zip_code'] = Variable<String>(zipCode.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddressTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('street: $street, ')
          ..write('city: $city, ')
          ..write('zipCode: $zipCode, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AddressTableTable addressTable = $AddressTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [addressTable];
}

typedef $$AddressTableTableCreateCompanionBuilder = AddressTableCompanion
    Function({
  required String id,
  required String name,
  required String street,
  required String city,
  required String zipCode,
  required String phoneNumber,
  Value<int> rowid,
});
typedef $$AddressTableTableUpdateCompanionBuilder = AddressTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> street,
  Value<String> city,
  Value<String> zipCode,
  Value<String> phoneNumber,
  Value<int> rowid,
});

class $$AddressTableTableFilterComposer
    extends Composer<_$AppDatabase, $AddressTableTable> {
  $$AddressTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get zipCode => $composableBuilder(
      column: $table.zipCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));
}

class $$AddressTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AddressTableTable> {
  $$AddressTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get zipCode => $composableBuilder(
      column: $table.zipCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));
}

class $$AddressTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AddressTableTable> {
  $$AddressTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get zipCode =>
      $composableBuilder(column: $table.zipCode, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);
}

class $$AddressTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AddressTableTable,
    AddressTableData,
    $$AddressTableTableFilterComposer,
    $$AddressTableTableOrderingComposer,
    $$AddressTableTableAnnotationComposer,
    $$AddressTableTableCreateCompanionBuilder,
    $$AddressTableTableUpdateCompanionBuilder,
    (
      AddressTableData,
      BaseReferences<_$AppDatabase, $AddressTableTable, AddressTableData>
    ),
    AddressTableData,
    PrefetchHooks Function()> {
  $$AddressTableTableTableManager(_$AppDatabase db, $AddressTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AddressTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AddressTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AddressTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> street = const Value.absent(),
            Value<String> city = const Value.absent(),
            Value<String> zipCode = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AddressTableCompanion(
            id: id,
            name: name,
            street: street,
            city: city,
            zipCode: zipCode,
            phoneNumber: phoneNumber,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String street,
            required String city,
            required String zipCode,
            required String phoneNumber,
            Value<int> rowid = const Value.absent(),
          }) =>
              AddressTableCompanion.insert(
            id: id,
            name: name,
            street: street,
            city: city,
            zipCode: zipCode,
            phoneNumber: phoneNumber,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AddressTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AddressTableTable,
    AddressTableData,
    $$AddressTableTableFilterComposer,
    $$AddressTableTableOrderingComposer,
    $$AddressTableTableAnnotationComposer,
    $$AddressTableTableCreateCompanionBuilder,
    $$AddressTableTableUpdateCompanionBuilder,
    (
      AddressTableData,
      BaseReferences<_$AppDatabase, $AddressTableTable, AddressTableData>
    ),
    AddressTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AddressTableTableTableManager get addressTable =>
      $$AddressTableTableTableManager(_db, _db.addressTable);
}
