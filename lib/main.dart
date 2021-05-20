import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Photo.dart';
import 'package:http/http.dart' as http;

import 'models/Album.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Isolate Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Isolate Demo'),
        ),
        body: Center(
          child: FutureBuilder<List<Photo>>(
            future: fetchPhoto(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return PhotoList(snapshot.data!);
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

class PhotoList extends StatelessWidget {
  final List<Photo> list;

  PhotoList(this.list);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Image.network(list[index].url);
        });
  }
}

Future<List<Photo>> fetchPhoto(http.Client client) async {
  final http.Response response =
      await client.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  if (response.statusCode == 200) {
    return compute(parseResponse, response.body);
  } else {
    throw Exception('Failed to load Album');
  }
}

List<Photo> parseResponse(String responseBody) {
  var parsedMap = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsedMap.map<Photo>((json) => Photo.fromJSON(json)).toList();
}
