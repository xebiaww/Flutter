import 'package:flutter/material.dart';

/// A proxy of the catalog of items the user can buy.


class CatalogModel{
  static List<String> itemNames =[
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  Item getByID(int id) => Item(id,itemNames[id]);

  Item getByPosition(int pos) => getByID(pos);

}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id,this.name): color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hascode => id;
}