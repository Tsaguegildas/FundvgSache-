// // import 'dart:html';
// //
// // import 'package:flutter/material.dart';
// // import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// // import 'package:untitled/SQLite/sqlite.dart';
// //
// // void main() {
// //   // sqfliteFfiInit();
// //   // databaseFactory = databaseFactoryFfi;
// //   // //databaseFactory = databaseFactoryFfi;
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('SQLite Example'),
// //         ),
// //         body: Center(
// //           child: ElevatedButton(
// //             onPressed: () async {
// //               DatabaseHelper dbHelper = DatabaseHelper.instance;
// //               int userId = await dbHelper.insertUser('John', 30);
// //               print('Inserted user with ID: $userId');
// //             },
// //             child: Text('Insert User'),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:untitled/Authentification/login.dart';
// import 'package:untitled/home.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import 'Authentification/login.dart';
//
// Future main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }
