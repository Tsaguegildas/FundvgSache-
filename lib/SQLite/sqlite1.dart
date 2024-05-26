// import 'package:untitled/models/users.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// // import 'dart:async';
// // import 'dart:io';
// //import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//
//
//
// ////------ jetz versuche ich mich mit unserer Databenke zu verbinden ------////
//
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   static Database? _database;
//
//   DatabaseHelper._privateConstructor();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'User.db');
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }
//
//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute(
//       'CREATE TABLE users(usrID INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT)',
//     );
//   }
//
//
//   // Future close() async{
//   //   final db = await instance.database;
//   //   db.close();
//   // }
//   // final databaseName = "note.db";
//  /// String users =" create table users(usrID INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT)";
//   //
//   // Future<Database> initDB() async {
//   //   final databasePath = await getDatabasesPath();
//   //   final path = join(databasePath, databaseName);
//   //
//   //   return openDatabase(path, version: 1, onCreate: (db, version) async {
//   //     await db.execute(users);
//   //   });
//    }
// ////----------    login Funktion                   --------------------/////
//   Future<bool> loginUsr(Users user) async {
//     final Database db = await instance.database;
//     var result = await db.rawQuery("select * from users where usrName= '${user.usrName}' AND usrPassword='${user.usrPassword}'");
//     if (result.isNotEmpty) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   ////--------          Sign up                        ------////
//   Future<int> signup(Users user) async {
//     final Database db = await instance.database;
//     print("Le nom  2 est  ${user.usrName}");
//     return db.insert('users', user.toMap());
//   }
// }
//
//
