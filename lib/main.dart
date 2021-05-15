import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/screens/catalog.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return

      MultiProvider(
        providers: [
          // In this sample app, CatalogModel never changes, so a simple Provider
          // is sufficient.
          Provider(create: (context) => CatalogModel()),
          // CartModel is implemented as a ChangeNotifier, which calls for the use
          // of ChangeNotifierProvider. Moreover, CartModel depends
          // on CatalogModel, so a ProxyProvider is needed.
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              // cart.catalog = catalog;
              return cart;
            },
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
            initialRoute: '/',
            routes: {
              '/': (context) => ELogin(),
              '/catalog': (context) => ECatalog(),
              // '/cart': (context) => Cart(),
            },

    ),
      );
  }
}

