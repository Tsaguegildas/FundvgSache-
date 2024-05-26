import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
//import 'package:untitled/home.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:untitled/SQLite/sqlite.dart';
import 'Authentification/login.dart';
import 'package:sqflite/sqflite.dart';

Future <void> main() async{

  //WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   databaseFactory = databaseFactoryFfiWeb;
  // }
  // final database = openDatabase(
  //   join(await getDatabasesPath(), 'user.db'),
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
