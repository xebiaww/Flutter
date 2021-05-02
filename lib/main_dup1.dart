import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Demo'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 1,
                  child: Image.asset('images/img1.png')),
              Expanded(
                  flex: 2,
                  child: Image.asset('images/img2.png')),
              Expanded(
                  flex: 1,
                  child: Image.asset('images/img3.png')),
              Image.asset(
                  'images/img1.png',width: 50,height: 50),
              Image.asset('images/img2.png',width: 50,height: 50),
              Image.asset('images/img3.png',width: 50,height: 50),
            ],
          )
        ),
      )
    );
  }
}

