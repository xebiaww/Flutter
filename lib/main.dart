import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      title: 'Battery Level Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Battery Level Demo'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: DefaultTextStyle(
            style: descTextStyle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Get Battery Level'),
                Container(
                  width: 300,
                  height: 100,
                  margin: EdgeInsets.all(30),
                  child: BatteryFrame(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BatteryFrame extends StatefulWidget {
  @override
  _BatteryFrameState createState() => _BatteryFrameState();
}

class _BatteryFrameState extends State<BatteryFrame> {
  String _batteryLevel = '(Unknown battery level)';
  static const batteryPlatform = const MethodChannel('hs.flutter.demo/battery');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: _getBatteryLevel,
          child: Text(
            'GET',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Text(_batteryLevel)
      ]),
    );
  }

  _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result =
          await batteryPlatform.invokeMethod('getPlatformBatteryLevel');
      batteryLevel = '(Battery Level at $result %)';
    } on PlatformException catch (e) {
      batteryLevel = '(Failed to get Battery Level: ${e.message})';
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
