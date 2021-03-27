import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
  }
  


  class _HomePage extends State<HomePage> {
    Map itemList = {};
    Map itemData = {};
    
    // String itemName;
    // String itemCount;
    // String itemType;
    // String itemSubtractBy;

    double iconSize = 24;

    Widget buildNewItem() {
      return Column(
        children: [
          Row(
            children: [
              TextButton(
                child: Text(itemData['itemName']),
                onPressed: () {
                  Navigator.pushNamed(context, '/item_details', arguments: {
                    'itemName': itemData['itemName'],
                    'itemCount': itemData['itemCount'],
                    'itemType': itemData['itemType'],
                    'itemSubtractBy': itemData['itemSubtractBy'],
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                iconSize: iconSize,

                onPressed: () {
                  setState(() {
                    itemData['itemCount'] = (int.parse(itemData['itemCount']) - int.parse(itemData['itemSubtractBy'])).toString();
                  });
                },
              ),
              Text(itemData['itemCount']),
              Text(itemData['itemType']),
              IconButton(
                icon: const Icon(Icons.add_sharp),
                iconSize: iconSize,

                onPressed: () {
                  setState(() {
                    itemData['itemCount'] = (int.parse(itemData['itemCount']) + int.parse(itemData['itemSubtractBy'])).toString();
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
  // setState(() {
  //   itemList[itemData['itemName']] = itemData;
  // });

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
    
    body:  
     Column(
       children: [
         Row(
           children: [
             if(itemData != null && itemData.length > 0)
             buildNewItem(),
           ],
         ),
       ],
     ),
            

);
  }

    
    
}

