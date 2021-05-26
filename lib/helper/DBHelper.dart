import 'package:flutter_app/models/Album.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_album';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnCount = 'songscount';

  // make this a singleton class
  DBHelper._privateConstructor();

  static final DBHelper instance = DBHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    // When the database is first created, create a table to store Albums
    /*CREATE TABLE
        $table (
        $columnId INTEGER PRIMARY KEY,
         $columnName TEXT NOT NULL,
         $columnCount INTEGER NOT NULL
        )*/
    await db.execute(
      'CREATE TABLE $table($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnCount INTEGER)',
    );
  }

  Future<int> insertAlbum(Album album) async {
    Database? db = await instance.database;
    int future = await db!.insert(table, album.toJSON());

    return future;
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> deleteAlbum(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: '$columnId= ?', whereArgs: [id]);
  }

  Future<int> updateAlbum(Album album) async {
    Database? db = await instance.database;
    return await db!.update(
        table, album.toJSON(), where: '$columnId = ?', whereArgs: [album.id]);
  }

  Future<List<Map<String,dynamic>>> getAlbums() async{
Database? db= await instance.database;
List<Map<String,dynamic>>list= await db!.query(table);
return list;
  }

}
