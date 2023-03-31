// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehalper {
  static const _databasename = 'persnol.db';
  static const _databaseversion = 1;
  static const table = "my_table";
  static const columnID = "id";
  static const columnName = "name";
  static const columnage = "age";
  static Database? _database;

  Databasehalper._privateConstructor();
  static final Databasehalper instance = Databasehalper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentdirectory.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table(
      $columnID INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL,
      $columnage INTEGER NOT NULL,
      )''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Databasehalper db = (await instance.database) as Databasehalper;
    return await db.insert(row);
  }
}
