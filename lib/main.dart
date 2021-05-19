// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //vid inst
  WidgetsFlutterBinding.ensureInitialized();
/*
var initializationSettingsAndroid = AndroidInitializationSettings('codex_logo')
*/
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true;
      requestBadgePermission: true;
      requestSoundPermission: true;
      onDidReceiveLocalNotification: (ind id, String title, String body, String payload) async{});
  void initializationSettings= InitializationSettings(
  //initializationSettingsAndroid,
  intitializeSettingsIOS);
  await flutterNotificationsPlugin.initialize(initializationSettings,
  onSelectNotifications: (String payload) azync{
  if (payload != null) {
    debugPrint('notification payload: ' + payload);
  }
  })
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