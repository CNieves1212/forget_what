// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'services/storage.dart';
import 'package:forget_what/disclaimer_at_login.dart';
import 'package:forget_what/home_page.dart';
import 'package:forget_what/item_details.dart';
import 'package:forget_what/add_item.dart';
import 'package:forget_what/models/custom_user.dart';
import 'package:forget_what/services/authentication_services.dart';
import 'package:forget_what/sign_up.dart';
import 'package:forget_what/sign_in.dart';
import 'package:forget_what/about_us.dart';
import 'package:forget_what/disclaimer.dart';
import 'package:forget_what/known_bugs.dart';


// initialization for notifications, has to be out here
// to be accessed by other pages
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  // notification setup
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

  // firebase auth startup
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
          routes: {//all accessible pages
            '/home_page': (context) => HomePage(),
            '/add_item': (context) => AddItem(storage: Storage()),
            '/item_details': (context) => ItemDetails(storage: Storage()),
            '/sign_up': (context) => SignUp(),
            '/sign_in': (context) => SignIn(),
            '/disclaimer': (context) => Disclaimer(),
            '/disclaimer_at_login': (context) => DisclaimerAtLogin(),
            '/known_bugs': (context) => KnownBugs(),
            '/about_us': (context) => AboutUs(),
          },
      ),
    );
  }
}

// directs user based on if they are logged in or not
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    if(user != null) {
      return HomePage();
    }
    else {
      return DisclaimerAtLogin();
    }
  }
}