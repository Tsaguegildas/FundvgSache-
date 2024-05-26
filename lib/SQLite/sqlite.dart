import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../models/users.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init() {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    } else {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    String dbPath;
    if (kIsWeb) {
      dbPath = filePath;
    } else {
      //print(" niveau 2 " + dbPath );
      final databasesPath = await getDatabasesPath();
      dbPath = join(databasesPath, filePath);
    }

    return await openDatabase(dbPath, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NOT NULL, password TEXT NOT NULL)',
    );
  }

   Future<int> createUser() async {
    final user = Users(usrName: "Gildas", usrPassword: "gildas0740");
    final db = await instance.database;
    final result = db.insert('user', user.toMap());
    print("Hier ist das Ergebnis $result");
    return result;
    //  try {
    //    final user = Users(usrName: "Gildas", usrPassword: "gildas0740");
    //    final Database db = await instance.database;
    //    final r =await db.insert('user', user.toMap());
    //    print("Hier ist die Ergebnis $r");
    //    return r;
    //  } catch (e) {
    //    print("Error in createUser: $e");
    //    return -1; // or handle the error as appropriate
    //  }
  }

  Future<bool> loginUsr(Users user) async {
    final Database db = await instance.database;
    var result = await db.query(
      'user',
      where: 'username = ? AND password = ?',
      whereArgs: [user.usrName, user.usrPassword],
    );
    return result.isNotEmpty;
  }

  Future<int> signup(Users user) async {
    final Database db = await instance.database;
    return await db.insert('user', user.toMap());
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}


