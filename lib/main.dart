import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/rendering.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
    height: 2,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Launch Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('URL Launch Demo'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: DefaultTextStyle(

            style: descTextStyle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Launch Flutter Site'),
                Container(
                  width: 300,
                  height: 100,
                  margin: EdgeInsets.all(30),
                  child: NativeButton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class NativeButton extends StatefulWidget {
  @override
  _NativeButtonState createState() => _NativeButtonState();
}

class _NativeButtonState extends State<NativeButton> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _launchURL,
        child: Text(
          'Launch!!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.io';
    // if (await canLaunch(url)) {
      await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}

