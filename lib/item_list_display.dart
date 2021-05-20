import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:forget_what/add_item.dart' as AddItem;
import 'package:forget_what/main.dart' as Main;
import 'package:forget_what/services/storage.dart';
import 'package:forget_what/Item.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:timezone/timezone.dart' as tz;
import 'models/time_zone.dart';

void scheduleAlarm() async {
  DateTime scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 5));

  final timeZone = TimeZone();

    // The device's timezone.
    String timeZoneName = await timeZone.getTimeZoneName();

    // Find the 'current location'
    final location = await timeZone.getLocation(timeZoneName);

    final scheduledDate = tz.TZDateTime.from(scheduledNotificationDateTime, location);
    print(scheduledNotificationDateTime);
    print(scheduledDate);
  AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'Channel for Alarm notification',
    icon: 'codex_logo',
    sound: RawResourceAndroidNotificationSound('test_sound'),
    largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
  ); //AndroidNotificationDetails

  IOSNotificationDetails iOSPlatformChannelSpecifics = IOSNotificationDetails(
    sound: 'a_long_cold_sting.wav', //sound file
    presentAlert: true,
    presentBadge: true,
    presentSound: true);
NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
  
  await Main.flutterLocalNotificationsPlugin.zonedSchedule(
    1,
    'Office', //replace with item name
    'Your alarm is finished',
    scheduledDate,
    platformChannelSpecifics, 
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
}


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
      
      // print(Directory("/data/user/0/com.example.forget_what/app_flutter/$uid/").listSync().toString());
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
                  scheduleAlarm();
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
