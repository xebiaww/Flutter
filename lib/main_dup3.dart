import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var stars = Row(
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );



    final ratings = Container(
      padding: EdgeInsets.all(10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          stars,
          SizedBox(width: 50),
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          )
        ],
      ),
    );

    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    // DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    final leftColumn = Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          ratings,
          iconList,
        ],
      ),
    );


    // The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
// The List.generate() constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
    List<Container> _buildGridTileList(int count) => List.generate(
        count, (i) => Container(

        child: Image.asset('images/img$i.png',)));


    ListTile _tile(String title, String subtitle, Image image) => ListTile(
      title: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: image,
    );

    Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        children: _buildGridTileList(11));


    Widget _buildList() => Stack(
      children: [
        _tile(
            'Uddapi Restro', 'onion wada',
            Image.asset('images/img0.png')
        ),
        _tile(
            'Sagar Ratna', 'Masala Dosa',
            Image.asset('images/img1.png')
        ),
        _tile(
            'Donut Factory', 'Illusion',
            Image.asset('images/img2.png')
        ),
        _tile(
            'Roxie Retro Bar', 'Medu Wada',
            Image.asset('images/img3.png')
        ),
        _tile(
            'Tiger Restaurant', '501 Buckingham Way',
            Image.asset('images/img4.png')
        ),
        _tile(
            'Dildona Donuts', 'lovely bites',
            Image.asset('images/img5.png')
        ),
        Divider(thickness: 4,),
        _tile('K\'s Kitchen', '757 Monterey Blvd',
            Image.asset('images/img6.png')
        ),
        _tile('Emmy\'s Restaurant', '1923 Ocean Ave',
            Image.asset('images/img7.png')
        ),
        _tile(
            'Chaiya Thai Restaurant', '272 Claremont Blvd',
            Image.asset('images/img8.png')
        ),
        _tile('La Ciccia', '291 30th St',
            Image.asset('images/img9.png')
        ),
      ],
    );





    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blueGrey,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Menu '),
          ),
          body: Center(

            // child: _buildGrid(),
            child: _buildList()
          ),
        )
    );
  }
}

