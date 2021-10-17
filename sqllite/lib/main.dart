// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sqllite/database_helper.dart';
// import 'package:sqllite/editAdd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  int? i = await DatabaseHelper.instance
                      .insertNote({DatabaseHelper.columnName: 'Saheb'});
                  print('The inserted id is $i');
                },
                child: const Text('INSERT'),
                style: ElevatedButton.styleFrom(primary: Colors.grey)),
            ElevatedButton(
                onPressed: () async {
                  List<Map<String, dynamic>>? queryNotes =
                      await DatabaseHelper.instance.queryAll();
                  print(queryNotes);
                },
                child: const Text('QUERY'),
                style: ElevatedButton.styleFrom(primary: Colors.green)),
            ElevatedButton(
                onPressed: () async {
                  int? updateID = await DatabaseHelper.instance.update({
                    DatabaseHelper.columnId: 2,
                    DatabaseHelper.columnName: 'Mark'
                  });
                  print(updateID);
                  //this returns number of rows updated
                },
                child: const Text('UPDATE'),
                style: ElevatedButton.styleFrom(primary: Colors.blue)),
            ElevatedButton(
                onPressed: () async {
                  int? rowsAffected = await DatabaseHelper.instance.delete(4);
                  print(rowsAffected);
                },
                child: const Text('DELETE'),
                style: ElevatedButton.styleFrom(primary: Colors.red)),
          ],
        ),
      ),
    );
  }
}
