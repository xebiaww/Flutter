import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/helper/DBHelper.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/Album.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SQLite CRUD Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Insert'),
                onPressed: () {
                  insertAlbum();
                },
              ),
              ElevatedButton(

                child: Text('Delete'),
                onPressed: () {
                  deleteAlbum();
                },
              ),
              ElevatedButton(
                child: Text('Update'),
                onPressed: () {
                  updateAlbum();
                },
              ),
              ElevatedButton(
                child: Text('Retrieve'),
                onPressed: () {
                  getAllAlbums();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future insertAlbum() async {
    var linkin = Album(
      id: 0,
      title: 'Linkin',
      noOfSongs: 5,
    );

    int result = await DBHelper.instance.insertAlbum(linkin);
    print('Result Insert-> Row inserted with ID: $result');

  }



  deleteAlbum() async {
    int result = await DBHelper.instance.deleteAlbum(0);
    print('Result Delete-->  $result rows affected');

  }

  updateAlbum() async{
    Album album=Album(id: 0, title: 'UpdatedTitle', noOfSongs: 23);
    int result=await DBHelper.instance.updateAlbum(album);
    print('Result Update-->  $result rows affected');
  }

  void getAllAlbums() async {
   List list= await DBHelper.instance.getAlbums();
   print('Retrieving all albums');
   list.forEach((element) {
     print('Album--> $element');
   });
  }
}
