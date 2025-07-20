import 'package:flow_plan/common/models/task_modal.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute(
      "CREATE TABLE flowPlans("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "title STRING,desc TEXT, date STRING, "
      "startTime STRING, endTime STRING, "
      "reminder INTEGER, repeat STRING, "
      "isCompleted INTEGER"
      ")",
    );

    await database.execute(
      "CREATE TABLE user ( id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, "
      "isVerified INTEGER )",
    );
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'flow_plan',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<int> createItem(Task task) async {
    final db = await DBHelper.db();
    final id = await db.insert(
      "flowPlans",
      task.toJson(),
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<int> createUser(int isVerified) async {
    final db = await DBHelper.db();

    final data = {'id': 1, 'isVerified': isVerified};
    final id = await db.insert(
      "user",
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await DBHelper.db();
    return db.query('user', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();
    return db.query('flowPlans', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await DBHelper.db();
    return db.query('flowPlans', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
    int id,
    String title,
    String desc,
    int isCompleted,
    String date,
    String startTime,
    String endTime,
    int reminder,
    String repeat,
  ) async {
    final db = await DBHelper.db();
    final data = {
      "title": title,
      "desc": desc,
      "isCompleted": isCompleted,
      "date": date,
      "startTime": startTime,
      "endTime": endTime,
    };
    final results = db.update(
      "flowPlans",
      data,
      where: "id = ?",
      whereArgs: [id],
    );
    return results;
  }

  static Future<void> deleteItem(int id) async {
    final db = await DBHelper.db();
    try {
      db.delete("flowPlans", whereArgs: [id], where: "id = ?");
    } catch (e) {
      debugPrint("Unable to delete $e");
    }
  }
} // 5:50:00
