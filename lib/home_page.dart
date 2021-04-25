import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'dart:async';
import 'all_item_data.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  double iconSize = 24;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // start to timey wimey stuff

    // void callbackHandle() {
    //   // implement notifications
    // }

    // Duration dayTime = Duration(seconds:2);
    // Timer dayTimer = Timer(dayTime, callbackHandle);

    Map newItem = ModalRoute.of(context).settings.arguments;
    if (newItem != null && newItem.length > 0) {
      allItemsList.add(newItem);
    }
    print('homepage refresh is $allItemsList');
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
            itemCount: allItemsList.length,
            itemBuilder: (context, int index) {
              Map oneItem = allItemsList[index];
              
              return Row(
                children: [
                  TextButton(
                    child: Text(oneItem['itemName']),
                    onPressed: () {
                      Navigator.pushNamed(context, '/item_details',
                          arguments: oneItem);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    iconSize: iconSize,
                    onPressed: () {
                      setState(() {
                        // AllItemData().itemSubtract(oneItem);
                        // AllItemData().updateLog(oneItem);
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
                        AllItemData().itemAdd(oneItem);
                      });
                    },
                  ),
                ],
              );
            }));
  }
}
