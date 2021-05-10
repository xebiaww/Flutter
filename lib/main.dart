/*Example 1:Using material routes or by defining route names in routes*/

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    initialRoute: '/',  // start the app with initial route. Here it is First Route
    routes: {
      '/':(context)=>FirstRoute(),
      '/second':(context)=>SecondRoute(),
    },
  ));
}


class FirstRoute extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    log('MyApp build');

    // final ScreenArguments screenArguments=ModalRoute.of(context)!.settings.arguments! as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
//navigate to second route
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondRoute()));
          Navigator.pushNamed(context, '/second');
          },
          child: Text("Navigate"),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(

              onPressed: () {
                // navigate back to first route
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdRoute() ));
              },
              child: Text('Go to Third'),
            ),
            ElevatedButton(
              onPressed: () {
                // navigate back to first route
                Navigator.pop(context);
              },
              child: Text('Go Back!'),
            ),
          ],
        ),
      )

    );
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // navigate back to first route
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false,arguments: ScreenArguments("Welcome Back", "This message is extracted in build method"));
            // Navigator.pushNamed(context, '/');
          },
          child: Text('Go Back to Home!'),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
*/

/*Example 2 Using onGenerateRoute*/
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
      // Provide a function to handle named routes.
      // Use this function to identify the named
      // route being pushed, and create the correct
      // Screen.
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == PassArgumentsScreen.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final ScreenArguments args = settings.arguments as ScreenArguments;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
        // The code only supports
        // PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      title: 'Navigation with Arguments',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // A button that navigates to a named route.
            // The named route extracts the arguments
            // by itself.
            ElevatedButton(
              child: Text("Navigate to screen that extracts arguments"),
              onPressed: () {
                // When the user taps the button,
                // navigate to a named route and
                // provide the arguments as an optional
                // parameter.
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Extract Arguments Screen',
                    'This message is extracted in the build method.',
                  ),
                );
              },
            ),
            // A button that navigates to a named route.
            // For this route, extract the arguments in
            // the onGenerateRoute function and pass them
            // to the screen.
            ElevatedButton(
              child: Text("Navigate to a named that accepts arguments"),
              onPressed: () {
                // When the user taps the button, navigate
                // to a named route and provide the arguments
                // as an optional parameter.
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute function.',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// A Widget that extracts the necessary arguments from
// the ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final ScreenArguments args =
    ModalRoute
        .of(context)!
        .settings
        .arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

// A Widget that accepts the necessary arguments via the
// constructor.
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // This Widget accepts the arguments as constructor
  // parameters. It does not extract the arguments from
  // the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute
  // function provided to the MaterialApp widget.
  const PassArgumentsScreen({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pushAndRemoveUntil(context,
            //     MaterialPageRoute(builder: (context) => PassDataBack()),(route)=>false);
            Navigator.pop(context,"Back to Data Class");
          },
          child: Text(message),
        ),
      ),
    );
  }
}

// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class PassDataBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("PassDataBack"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              startActivityForResult(context);
            },
            child: Text('Wait for result'),
          ),
        )
    );
  }
}

void startActivityForResult(BuildContext context) async {
  final result = await Navigator.pushNamed(
    context,
    PassArgumentsScreen.routeName, arguments: ScreenArguments("From Data Back","Page is waiting for result")
  );

  // After the PassArgumentsScreen returns a result, hide any previous snackbars
  // and show the new result.
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$result",style: TextStyle(color: Colors.amber),)));
}
