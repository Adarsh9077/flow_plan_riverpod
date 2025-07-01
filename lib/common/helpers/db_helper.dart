import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
      "CREATE TABLE flowPlans("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "title STRING,desc TEXT, date STRING, "
      "startTime STRING, endTime STRING, "
      "remind INTEGER, repeat STRING, "
      "isCompleted INTEGER"
      ")",
    );
  }
} // 5:28:25