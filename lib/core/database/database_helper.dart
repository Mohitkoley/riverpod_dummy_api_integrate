import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/models/address_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  // Table name
  static const String tableAddresses = 'addresses';

  // Column names
  static const String colId = 'id';
  static const String colName = 'name';
  static const String colStreet = 'street';
  static const String colCity = 'city';
  static const String colZipCode = 'zipCode';
  static const String colPhoneNumber = 'phoneNumber';

  // Singleton pattern
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'addresses.db');

    // Open/create the database at a given path
    final addressesDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return addressesDatabase;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE $tableAddresses (
        $colId TEXT PRIMARY KEY,
        $colName TEXT NOT NULL,
        $colStreet TEXT NOT NULL,
        $colCity TEXT NOT NULL,
        $colZipCode TEXT NOT NULL,
        $colPhoneNumber TEXT NOT NULL
      )
    ''');
  }

  // Insert Operation: Insert a Address object to database
  Future<int> insertAddress(AddressModel address) async {
    final db = await database;
    final result = await db.insert(tableAddresses, address.toMap());
    return result;
  }

  // Get Operation: Get all Address objects from database
  Future<List<AddressModel>> getAddressList() async {
    final db = await database;
    final result = await db.query(tableAddresses, orderBy: '$colName ASC');
    return result.map((e) => AddressModel.fromMap(e)).toList();
  }

  // Get Operation: Get a single Address object by id
  Future<AddressModel?> getAddressById(String id) async {
    final db = await database;
    final result = await db.query(
      tableAddresses,
      where: '$colId = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return AddressModel.fromMap(result.first);
    }
    return null;
  }

  // Update Operation: Update a Address object and save it to database
  Future<int> updateAddress(AddressModel address) async {
    final db = await database;
    final result = await db.update(
      tableAddresses,
      address.toMap(),
      where: '$colId = ?',
      whereArgs: [address.id],
    );
    return result;
  }

  // Delete Operation: Delete a Address object from database
  Future<int> deleteAddress(String id) async {
    final db = await database;
    final result = await db.delete(
      tableAddresses,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }

  // Get number of Address objects in database
  Future<int> getCount() async {
    final db = await database;
    final result = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM $tableAddresses'),
    );
    return result ?? 0;
  }

  // Close database
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
