// class taken from https://stackoverflow.com/questions/64305469/how-to-convert-datetime-to-tzdatetime-in-flutter
// we did not write, we found on stack overflow and the person basically said anyone could use it.
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart' as t;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:forget_what/main.dart' as Main;


class TimeZone {
  factory TimeZone() => _this ?? TimeZone._();

  TimeZone._() {
    initializeTimeZones();
  }
  static TimeZone _this;

  Future<String> getTimeZoneName() async => FlutterNativeTimezone.getLocalTimezone();

  Future<t.Location> getLocation([String timeZoneName]) async {
    if(timeZoneName == null || timeZoneName.isEmpty){
      timeZoneName = await getTimeZoneName();
    }
    return t.getLocation(timeZoneName);
  }
}

// this was written and adapted by us from tutorials
void scheduleAlarm(Map<String, dynamic> itemAsMap) async {
  int hours;
  int mins;

  // handle no input for hours/minutes
  if(int.parse(itemAsMap['notifHours']) is int) {
    hours = int.parse(itemAsMap['notifHours']);
  }
  else {
    hours = 0;
  }
  if(int.parse(itemAsMap['notifMins']) is int) {
    mins = int.parse(itemAsMap['notifMins']);
  }
  else {
    mins = 0;
  }

  // setup timeZone and time for notification to send 
  DateTime scheduledNotificationDateTime = DateTime.now().add(Duration(hours: hours, minutes: mins));
  final timeZone = TimeZone();
    // The device's timezone.
    String timeZoneName = await timeZone.getTimeZoneName();
    // Find the 'current location'
    final location = await timeZone.getLocation(timeZoneName);
    final scheduledDate = tz.TZDateTime.from(scheduledNotificationDateTime, location);

    // setup notification settings for each iOS 
  AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'Channel for Alarm notification',
    icon: 'forget_what_logo',
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
    'Forget Something?',
    'Remember to take your ' + itemAsMap['itemSubtractBy'] + ' ' + itemAsMap['itemType']+ ' of ' + itemAsMap['itemName'],
    scheduledDate,
    platformChannelSpecifics, 
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
}