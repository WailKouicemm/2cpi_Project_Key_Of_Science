import 'dart:async';
import 'dart:core';
import 'package:sqflite/sqflite.dart';

import '../model/datatask.dart';
class Taskdb {
  static Database? _db;
  static final int_version = 1;
  static final String? _tableName = "tasks";

  static Future<void> initDb() async{
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + "tasks.db";
      _db = await openDatabase(
          _path,
        version: int_version,
        onCreate: (db,version){
            print("Creating a new one");
             return db.execute(
"CREATE TABLE $_tableName(""id INTEGER,""title String ,""startTime STRING,""endTime STRING,""remind INTEGER,""repeat INTEGER,""color COLORS",
            );
        }
      );
    } catch (e){
      print(e);
    }
  }
  static Future <int> insert(Datatask? datatask) async{
    print("insert function called");
    return await _db?.insert(_tableName!,datatask!.toJson())??1;
  }

  /*static Future<List<Map><String , dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }*/
}
