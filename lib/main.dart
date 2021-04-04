import 'package:flutter/material.dart';
import 'package:forget_what/home_page.dart';
import 'package:forget_what/item_details.dart';
import 'package:forget_what/add_item.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
    State<StatefulWidget> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forget What?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home_page', //first page loaded
      routes: { //all pages
        '/home_page': (context) => HomePage(),
        '/add_item': (context) => AddItem(),
        '/item_details': (context) => ItemDetails(),
      },
      );
  }
}