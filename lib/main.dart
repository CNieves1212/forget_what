import 'package:flutter/material.dart';
import 'package:forget_what/home_page.dart';
import 'package:forget_what/item_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
    State<StatefulWidget> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  String _searchedTerm;
  
  void _searchForTerm(String term) {
    this._searchedTerm = term;
    print(term);
  }

  
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forget What?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(key: HomePage.valueKey, child: HomePage(searchForTerm: _searchForTerm,)),
              if(_searchedTerm != null && _searchedTerm.isNotEmpty)
                MaterialPage(key: ItemDetails.valueKey, child: ItemDetails()),
        ],
        onPopPage: (route, result) {
          //return route.dipPop(result);      
        }
      ),
    );
  }
}