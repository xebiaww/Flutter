import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:provider/provider.dart';

class ECart extends StatelessWidget {
  static final String redirect_to_ecart='ecart';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.pink,
        backwardsCompatibility: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            // _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<CartModel>();
    return ListView.builder(
       itemCount: cart.itemIds.length,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () =>
                    cart.removeItemFromList(cart.itemIds.elementAt(index)),
              ),
          title: Text(cart.itemIds.elementAt(index).name,style: itemNameStyle,),
            ));
  }
}
