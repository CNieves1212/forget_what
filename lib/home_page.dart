import 'package:flutter/material.dart';
// import './main.dart' as test;

List<Map<String, dynamic>> allItems = [];

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Map itemData = {};

  double iconSize = 24;

  Widget buildNewItem(Map oneItem, int j) {
    print(oneItem);
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              child: Text(oneItem['itemName']),
              onPressed: () {
                Navigator.pushNamed(context, '/item_details', arguments: oneItem);
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              iconSize: iconSize,
              onPressed: () {
                setState(() {
                  oneItem['itemCount'] = (int.parse(oneItem['itemCount']) -
                          int.parse(oneItem['itemSubtractBy'])).toString();
                  oneItem['takenAmount'] = (int.parse(oneItem['takenAmount']) +
                          int.parse(oneItem['itemSubtractBy'])).toString();
                  //create something that adds time
                });
              },
            ),
            Text(oneItem['itemCount']),
            Text(oneItem['itemType']),
            IconButton(
              icon: const Icon(Icons.add_sharp),
              iconSize: iconSize,
              onPressed: () {
                setState(() {
                  oneItem['itemCount'] = (int.parse(oneItem['itemCount']) +
                          int.parse(oneItem['itemSubtractBy'])).toString();
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    itemData = ModalRoute.of(context).settings.arguments;
    if (itemData != null && itemData.length > 0) {
      allItems.add(itemData);
    }

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Forget What?'),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add Item',
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_item');
                  })
            ]),
        body: ListView.builder(
            itemCount: allItems.length,
            itemBuilder: (context, int index) {
              Map oneItem = allItems[index];

              return Card(
                child: ListTile(
                  onTap: () {},
                  title: buildNewItem(oneItem, index),
                ),
              );
            }
          )
        );
  }
}
