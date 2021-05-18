import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:provider/provider.dart';

import 'cart.dart';


class ECatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _EAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _ElistItem(index)))
        ],
      ),
    );
  }
}

class _EAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
      title: Text(
        'E-Catalog',
        style: Theme.of(context).textTheme.headline4,
      ),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () =>
              Navigator.pushNamed(context, ECart.redirect_to_ecart),
        )
      ],
    );
  }
}

class _ElistItem extends StatelessWidget {
  final index;

  _ElistItem(this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var item = context
        .select<CatalogModel, Item>((catalog) => catalog.getByPosition(index));
    var textTheme = Theme.of(context).textTheme.headline6;

    return Padding(
      padding: EdgeInsets.all(20),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 2, 10, 2),
                child: Text(
                  item.name,
                  style: textTheme,
                ),
              ),
            ),
            _AddButton(item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  _AddButton(this.item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // var isInCart =
    //     context.select<CartModel, bool>((cart) => cart.itemIds.contains(item));
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        var isInCart1 = cart.itemIds.where((element) => element.id==item.id);
        return TextButton(
          onPressed: () {
            var isInCart = cart.itemIds.where((element) => element.id==item.id);
            onAddClicked(!isInCart.isEmpty, cart, item);
          },

          child: !isInCart1.isEmpty
              ? Icon(Icons.check, semanticLabel: 'ADDED')
              : Text('ADD'),
        );
      },
    );
  }

  onAddClicked(bool isInCart, CartModel cart,Item item) {
    isInCart ? cart.removeItemFromList(item) : cart.addItemInList(item);
  }
}
