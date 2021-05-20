// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:forget_what/home_page.dart';
import 'package:forget_what/item_details.dart';
import 'package:forget_what/add_item.dart';
import 'package:forget_what/models/custom_user.dart';
import 'package:forget_what/services/authentication_services.dart';
import 'package:forget_what/sign_up.dart';
import 'package:forget_what/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/storage.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('codex_logo');

  IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (int id, String title, String body, String payload) async{},
      );


  InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  tz.initializeTimeZones();

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  onSelectNotification: (String payload) async{
  if (payload != null) {
    debugPrint('notification payload: ' + payload);
  }
  });
//vid inst end


  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
          value: AuthenticationService().user,
          initialData: null,
          child: MaterialApp(
          home: Wrapper(), //first page loaded
          routes: {//all pages
            '/home_page': (context) => HomePage(),
            '/add_item': (context) => AddItem(storage: Storage()),
            '/item_details': (context) => ItemDetails(),
            '/sign_up': (context) => SignUp(),
            '/sign_in': (context) => SignIn(),
          },
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    if(user != null) {
      return HomePage();
    }
    else {
      return SignUp();
    }
  }
}