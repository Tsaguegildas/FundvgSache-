import 'package:untitled/models/users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';



////------ jetz versuche ich mich mit unserer Databenke zu verbinden ------////

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> createUser(Map<String, dynamic> user) async {
    final db = await instance.database;
    final u1= Users(usrName: "Gildas", usrPassword: "gildas0740");
    int r =await db.insert('users', u1.toMap());
    return r ;
  }

////----------    login Funktion                   --------------------/////
  Future<bool> loginUsr(Users user) async {
    final Database db = await instance.database;
    var result = await db.rawQuery("select * from users where usrName= '${user
        .usrName}' AND usrPassword='${user.usrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

////--------          Sign up                        ------////
  Future<int> signup(Users user) async {
    final Database db = await instance.database;
    print("Le nom  2 est  ${user.usrName}");
    return db.insert('users', user.toMap());
  }

  /////////----------------------------------////////////

  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  ///// --------------//////////--------------------
  Future close() async {
    final db = await instance.database;
    db.close();
  }



}
