import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:forget_what/add_item.dart' as AddItem;
import 'package:forget_what/services/storage.dart';
import 'package:forget_what/Item.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';

class ItemListDisplay extends StatefulWidget {
  final Storage storage;
  ItemListDisplay({Key key, @required this.storage}) : super(key: key);

  @override
  _ItemListDisplayState createState() => _ItemListDisplayState();
}

class _ItemListDisplayState extends State<ItemListDisplay> {
  String state;
  Future<Directory> dir;
  String item;
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 48;
    double textFontSize = 24;

    // build individual cards for each item
    // ignore: missing_return
    Widget buildItemCard(String itemName) {
      //uid for cnieves@gmail.com: NgqTULsxF4SlkU7qRpXUoRFCzMS2
      
      print(Directory("/data/user/0/com.example.forget_what/app_flutter/$uid/").listSync().toString());
      Storage().readData("$itemName").then((String recievedItem) {
        setState(() {
          item = recievedItem.toString();
          
          }
        );
      });
      print('item is $item');
      if(item != null) {
        Map<String, dynamic> itemAsMap = Item().stringToMap(item);
        return Container(
        child: Row(
          children: [
            TextButton(
              child: Text(itemAsMap['itemName'], style: TextStyle(fontSize: textFontSize),),
              onPressed: () {
                Navigator.pushNamed(context, '/item_details',
                    arguments: itemAsMap);
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
            Text(itemAsMap['itemCount'], style: TextStyle(fontSize: textFontSize),),
            Text('  '),
            Text(itemAsMap['itemType'], style: TextStyle(fontSize: textFontSize),),
            IconButton(
              icon: const Icon(Icons.add_sharp),
              iconSize: iconSize,
              onPressed: () {
                setState(() {
                  // AllItemData().itemAdd(oneItem);
                });
              },
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      );
      }
      else if (item == null){
        print("reading a null file");
        // return Container();
      }
      else {
        return Container();
      }
      // print("recieved Item is " + item.toString());

      
    }

    // placeholder if user has no items
    if (AddItem.fileNames.length == 0) {
        return Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text("Add Some Items!", style: TextStyle(fontSize: textFontSize),),
            ],
          ),
        );
      }
    return ListView.builder(
      itemCount: AddItem.fileNames.length,
      itemBuilder: (context, index) {
        return buildItemCard(AddItem.fileNames[index]);
      },
    );
  }
}
