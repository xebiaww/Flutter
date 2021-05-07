import 'package:flutter/material.dart';
import 'dart:developer';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log('MyApp build');
    return MaterialApp(
        title: 'Flutter Layout Demo',
        theme: ThemeData(
          // This is the theme of your application.

          primarySwatch: Colors.blueGrey,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Layout Demo '),
          ),
          body: ListView(
            children: [
              Image.asset(
                'images/mainimage.jpg',
                fit: BoxFit.cover,
              ),
              _ParentWidget()
            ],
          ),
        ));
  }
}

class _ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() {
    // TODO: implement createState
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<_ParentWidget> {
  bool _active = false;
  int _favoriteCount = 42;

  void _handleTapboxChanged(bool newValue) => {
        setState(() {
          _active = newValue;
        })
      };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    log('_ParentWidgetState build');
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: ChildWidget(
          _active,
          _handleTapboxChanged,
        ),
        // child: ChildWidget(this.context, _active, _handleTapboxChanged(_active)),
      ),

    );
  }
}

class ChildWidget extends StatefulWidget {
  bool active;
  final ValueChanged<bool> onChanged;

  ChildWidget(this.active, this.onChanged);







  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChildState();
  }
}

class ChildState extends State<ChildWidget> {
  bool highlight=false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    log('ChildWidget build');
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Open' : 'Closed',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: highlight
              ? Border.all(
            color: Colors.teal[700],
            width: 10.0,
          )
              : null,
        ),
      ),
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
    );
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }


  void _handleTapDown(TapDownDetails details) {
    setState(() {
      highlight=true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      highlight=false;
    });
  }
}
