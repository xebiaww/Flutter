import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}):super(key: key);

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
          body:  const _CheckEmailWidget(

          ),
        ));
  }
}

class _CheckEmailWidget extends StatefulWidget {

  const _CheckEmailWidget({Key? key}):super(key: key);

  @override
  _CheckEmailWidgetState createState() {
    // TODO: implement createState
    return _CheckEmailWidgetState();
  }
}

class _CheckEmailWidgetState extends State<_CheckEmailWidget> {

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    log('_ParentWidgetState build');
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              contentPadding: EdgeInsets.fromLTRB(20,0,0,0)
            ),

            validator: (String? value){
              RegExp reg=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if(value==null || value.isEmpty){
                return 'Please enter email id';
              }else if(!reg.hasMatch(value)){
                return 'Please enter a valid email id';
              }
              return null;
            },

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  //Process
                }

                  },
            child: const Text('Submit'),
              
            ),
          ),

        ],
      ),


    );
  }
}

