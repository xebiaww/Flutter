import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'models/Album.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppWidget createState() {
    // TODO: implement createState
    return MyAppWidget();
  }
}

class MyAppWidget extends State<MyApp> {
  late Future<Album> _futureAlbum;
  late bool deleted =false;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
    deleted=false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Delete Data Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delete'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${snapshot.data?.title ?? 'Deleted'}'),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if(!deleted) {
                                _futureAlbum =
                                    deleteAlbum(snapshot.data?.id.toString());
                              deleted=true;
                              }else{
                                _futureAlbum = fetchAlbum();
                                deleted=false;
                              }
                            });
                          },
                          child: Text('${(snapshot.data?.id==null)? 'Call API' : 'Delete Data'}')),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<Album> fetchAlbum() async {
  final http.Response response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Album');
  }
}

Future<Album> deleteAlbum(String? string) async {
  final http.Response response = await http.delete(
      Uri.parse(
          'https://jsonplaceholder.typicode.com/albums/$string'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete album');
  }
}
