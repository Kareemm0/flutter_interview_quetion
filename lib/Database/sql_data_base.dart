import 'package:flutter_interview_quetion/Database/create_data_base.dart';
import 'package:sqflite/sqflite.dart';

class SqlDataBase {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  static initialDB() async {
    String databasePath = await getDatabasesPath();
    String path = "$databasePath/questions.db";
    Database mydb = await openDatabase(
      path,
      version: 1,
      onCreate: CreateDataBase.createDB,
    );
    return mydb;
  }
}
