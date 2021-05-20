import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:forget_what/add_item.dart' as AddItem;
import 'package:forget_what/main.dart' as Main;
import 'package:forget_what/services/storage.dart';
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

    @override
  void initState() {
    super.initState();
    for(var file in AddItem.fileNames) {
      widget.storage.readData(file).then((String value) {
      setState(() {
        state = value;
      });
    });
    }
  }
    
  @override
  Widget build(BuildContext context) {
    double iconSize = 24;

  // build individual cards for each item 
  Widget buildItemCard(String item) {
    // print(item);
    if(item == null) {
      return Text("Add New Item!");
    }
    return Container(
      child: Row(
        children: [
          TextButton(
            child: Text(item),
            onPressed: () {
              Navigator.pushNamed(context, '/item_details', arguments: item);
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
          Text(item),
          Text('  '),
          Text(item),
          IconButton(
            icon: const Icon(Icons.add_sharp),
            iconSize: iconSize,
            onPressed: () {
              setState(() {
                // AllItemData().itemAdd(oneItem);
              });
            },
          ),
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
