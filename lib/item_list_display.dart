import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'services/time_zone.dart';
import 'package:forget_what/add_item.dart' as AddItem;
import 'package:forget_what/services/storage.dart';
import 'package:forget_what/models/Item.dart';



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
    
    // reads all the files that should be saved locally to then read from those files
    List<String> fileNames = [];
      String incomingString;
      Storage().readData("fileNames").then((String readString) {
          setState(() {
            // print(readString);
            incomingString = readString;
            }
          );
        });
      // doesn't work 
      if(fileNames.length != 0) {fileNames = incomingString.split(' ');}
      // print(fileNames);

    // build individual cards for each item
    Widget buildItemCard(String itemName) {
      
      // print(Directory("/data/user/0/com.example.forget_what/app_flutter/$uid/").listSync().toString());
      
      // reads individual files and turns them into Map one at a time as buildItemCard is called
      Storage().readData("$itemName").then((String recievedItem) {
        setState(() {
          item = recievedItem.toString();
          }
        );
      });
      
      if(item != null) {
        Map<String, dynamic> itemAsMap = Item().stringToMap(item);
        // print('itemAsMap is $itemAsMap');
        return Container(
        child: Row(
          children: [
            TextButton(
              child: Text(itemAsMap['itemName'], style: TextStyle(fontSize: textFontSize),),
              onPressed: () {
                Navigator.pushNamed(context, '/item_details', arguments: itemAsMap);
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              iconSize: iconSize,
              onPressed: () {
                setState(() {
                  if(itemAsMap['notificationOption']) {
                    scheduleAlarm(itemAsMap);
                  }
                  itemSubtract(itemAsMap);
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
                  itemAdd(itemAsMap);
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
        return Container();
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
