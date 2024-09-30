import 'package:sqflite/sqlite_api.dart';

import 'sql_data_base.dart';

class GetData {
  SqlDataBase sqlDataBase = SqlDataBase();
  Future<List<Map>> getQuestions(String sql) async {
    Database? mydb = await sqlDataBase.db;
    List<Map> list = await mydb!.rawQuery(sql);
    return list;
  }
}
