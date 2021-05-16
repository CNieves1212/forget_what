import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forget_what/services/authentication_services.dart';
import 'package:forget_what/services/storage.dart';
import 'item_list_display.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final AuthenticationService _firebasAuth = AuthenticationService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = 15;
    // make and feed an empty initial data into streamprovider
    // stream provider listens and fetches changes from firebase
    return Scaffold(
        drawer: Drawer(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text on top
              Container(
                padding: EdgeInsets.only(top: 25, left: 10),
                child: Text("Thanks for using Forget What?", style: TextStyle(fontSize: fontSize)),
              ),

              // Disclaimer Page
              Container(
                // TextButton(
                //   // child: Text("test"),
                //   // onPressed: () {
                //   //   Navigator.pushNamed(context, '/disclaimer_page.dart');
                //   // },
                  
                // ),
              ),

              // placeholder
              Container(

              ),
              
              // logout button
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  child: Text("LogOut"),
                  onPressed: () async {
                    await _firebasAuth.signOut();
                  },
                ),
              ),
            ],
        )
        ),


        
        appBar: AppBar(
            centerTitle: true,
            title: Text('Forget What?'),
            actions: <Widget>[
              // add item button
              IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add Item',
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_item');
                  }),
            ]),
        body: ItemListDisplay(storage: Storage()),
    );
  }
}
