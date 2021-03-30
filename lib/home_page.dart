import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}



class _HomePage extends State<HomePage> {
  Map itemData = {};

  double iconSize = 24;

  Widget buildNewItem(Map oneItem,int j) {
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
                  oneItem['itemCount'] = (int.parse(oneItem['itemCount']) - int.parse(oneItem['itemSubtractBy'])).toString();
                  oneItem['takenAmount'] = (int.parse(oneItem['takenAmount']) + int.parse(oneItem['itemSubtractBy'])).toString();
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
                  oneItem['itemCount'] = (int.parse(oneItem['itemCount']) + int.parse(oneItem['itemSubtractBy'])).toString();
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
    List<Map<String, dynamic>> allItems = [];

    itemData = ModalRoute.of(context).settings.arguments;
    if(itemData != null && itemData.length > 0) {
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
                  }
              )
            ]
        ),

        body: ListView.builder(
            itemCount: allItems.length,
            itemBuilder: (context, int index) {
              Map oneItem = allItems[index];

              return ListTile (
                title: buildNewItem(oneItem, index),
              );
            }

        )





      //  Column(
      //    children: [
      //      Row(
      //        children: [

      //          for(int j = 0; j < allItems.length; j++)
      //            if(itemData != null && itemData.length > 0)
      //               buildNewItem(allItems, j),

      //        ],
      //      ),
      //    ],
      //  ),


    );
  }



}







