# flutter_app

A new Flutter application.

## Demo 18

The objective of this demo is to get te battery level using platform specific code. The steps involve:

1) Create flutter platform client - Use _MethodChannel_ to send messages.
2) On Platform MethodChannel (Android) & Flutter MethodChannel (iOS) for receiving message and return result.
3) For Android :
Inside configureFlutterEngine() method, create a MethodChannel and call setMethodCallHandler()
4) Call the corresponding method and return result from native platform.

We are getting the Android Battery level in this demo.

#### App design ####
![picture alt](https://raw.githubusercontent.com/HimanshuSharma13/Flutter/feature_d18_battery_level_platform/screens/home1.png "App design screens")


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view 
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

- [Icons made by Freepik](https://www.freepik.com)
 -[from www.flaticon.com](https://www.flaticon.com/)
