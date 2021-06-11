import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/helper/DBHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'models/Album.dart';

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
      title: 'Native Platform Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Native Platform View Demo'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: DefaultTextStyle(

            style: descTextStyle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Display Native Button'),
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

class NativeButton extends StatelessWidget {
  @override
  // Widget build(BuildContext context) {
  //   // This is used in the platform side to register the view.
  //   final String viewType = '<platform-view-type>';
  //   // Pass parameters to the platform side.
  //   final Map<String, dynamic> creationParams = <String, dynamic>{};
  //   // TODO: implement build
  //   return PlatformViewLink(
  //     onCreatePlatformView: (PlatformViewCreationParams params) {
  //       return PlatformViewsService.initSurfaceAndroidView(
  //           id: params.id,
  //           viewType: viewType,
  //           creationParams: creationParams,
  //           creationParamsCodec: StandardMessageCodec(),
  //           layoutDirection: TextDirection.ltr)
  //         ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
  //         ..create();
  //     },
  //     viewType: viewType,
  //     surfaceFactory:
  //         (BuildContext context, PlatformViewController controller) {
  //       return AndroidViewSurface(
  //           controller: controller as AndroidViewController,
  //           hitTestBehavior: PlatformViewHitTestBehavior.opaque,
  //           gestureRecognizers: const <
  //               Factory<OneSequenceGestureRecognizer>>{});
  //     },
  //   );
  // }

  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    final String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return PlatformViewLink(
      viewType: viewType,
      surfaceFactory:
          (BuildContext context, PlatformViewController controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (PlatformViewCreationParams params) {
        return PlatformViewsService.initSurfaceAndroidView(
          id: params.id,
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: StandardMessageCodec(),
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }
}
