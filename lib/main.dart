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
<<<<<<< Updated upstream
      home: Navigator(
        pages: [
          MaterialPage(key: HomePage.valueKey, child: HomePage(searchForTerm: _searchForTerm,)),
              if(_searchedTerm != null && _searchedTerm.isNotEmpty)
<<<<<<< HEAD
                MaterialPage(key: ItemDetails.valueKey, child: ItemDetails(title: _searchedTerm)),
=======
                MaterialPage(key: ItemDetails.valueKey, child: ItemDetails()),
>>>>>>> a3fbb5a496afa8c7775152b7d83b8ff885e72f62
        ],
        onPopPage: (route, result) {
          //return route.dipPop(result);      
        }
      ),
    );
=======
      initialRoute: '/home_page', //first page loaded
      routes: { //all pages
        '/home_page': (context) => HomePage(),
        '/add_item': (context) => AddItem(),
        '/item_details': (context) => ItemDetails(),
      },
      );
>>>>>>> Stashed changes
  }
}