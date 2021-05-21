import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/Album.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Future<Album>? _futureAlbum;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'POST Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('POST Demo'),
        ),
        body: Center(
          child: _futureAlbum == null
              ? AlbumForm()
              : buildFutureAlbum(),
        ),
      ),
    );

  }

  Column AlbumForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Enter Title'),
        ),
        ElevatedButton(
            onPressed: () =>
            {
            setState(() {
            _futureAlbum = createAlbum(http.Client(), _controller.text);
            }
            )},



            child: Text('Create Album'))
      ],
    );
  }


  buildFutureAlbum() {
    return FutureBuilder<Album>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('Data from server: Album Name is ${snapshot.data?.title}');
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return CircularProgressIndicator();
        });
  }

}


Future<Album> createAlbum(http.Client client, String title) async {
  /*final response = await client.post(
    Uri.https('jsonplaceholder.typicode.com', 'albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );*/
  final http.Response response = await client.post(
      Uri.parse("https://jsonplaceholder.typicode.com/albums"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }));
  if (response.statusCode == 201) {
    return compute(parseResponse, response.body);
  } else {
    throw Exception('Failed to load Album');
  }
}

Album parseResponse(String responseBody) {
  return Album.fromJson(jsonDecode(responseBody));
}
