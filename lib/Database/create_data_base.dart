import 'package:flutter_interview_quetion/Database/sql_data_base.dart';
import 'package:sqflite/sqflite.dart';

class CreateDataBase {
  SqlDataBase sqlDataBase = SqlDataBase();
  static void createDB(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE "questions"(id INTEGER PRIMARY KEY AUTOINCREMENT,
         question TEXT NOT NULL,
         answer TEXT NOT NULL
        ) ''',
    );
  }
}
