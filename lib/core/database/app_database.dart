import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class AddressTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get street => text()();
  TextColumn get city => text()();
  TextColumn get zipCode => text()();
  TextColumn get phoneNumber => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [AddressTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

  // Address operations
  Future<List<AddressTableData>> getAllAddresses() =>
      select(addressTable).get();
  Future<int> insertAddress(Insertable<AddressTableData> address) =>
      into(addressTable).insert(address);
  Future<bool> updateAddress(Insertable<AddressTableData> address) =>
      update(addressTable).replace(address);
  Future<int> deleteAddress(String id) =>
      (delete(addressTable)..where((t) => t.id.equals(id))).go();
}
