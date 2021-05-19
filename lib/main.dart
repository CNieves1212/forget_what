// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forget_what/home_page.dart';
import 'package:forget_what/item_details.dart';
import 'package:forget_what/add_item.dart';
import 'package:forget_what/models/custom_user.dart';
import 'package:forget_what/services/authentication_services.dart';
import 'package:forget_what/sign_up.dart';
import 'package:forget_what/sign_in.dart';
import 'package:forget_what/about_us.dart';
import 'package:forget_what/disclaimer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/storage.dart';

void main() async {
  // needed to use firebase
  WidgetsFlutterBinding.ensureInitialized();
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
      return SignUp();
    }
  }
}