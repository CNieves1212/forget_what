import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forget_what/services/authentication_services.dart';
import 'package:forget_what/services/storage.dart';
import 'package:forget_what/item_list_display.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final AuthenticationService _firebasAuth = AuthenticationService();
  double titleFontSize = 32;
  double textFontSize = 24;
  double paddingSize = 24;
  Color fontColor = Colors.greenAccent[400];
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // flutter doesn't allow drawer icon to be changed
      // ideally it would be same size as other icons
      drawer: Drawer(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // text on top
            Container(
              padding: EdgeInsets.only(top: 25, left: 10),
              child: Text("Thanks for using Forget What?", style: TextStyle(fontSize: titleFontSize)),
            ),

            Padding(padding: EdgeInsets.only(top: paddingSize)),

            // Disclaimer Page
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent[400], // background
                  onPrimary: Colors.black, // foreground
                ),
              child: Text("Disclaimer Page", style: TextStyle(fontSize: textFontSize)),
              onPressed: () {
                Navigator.pushNamed(context, '/disclaimer');
              },
            ),

            Padding(padding: EdgeInsets.only(top: paddingSize)),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent[400], // background
                  onPrimary: Colors.black, // foreground
                ),
                child: Text('Known Bugs',
                    style: TextStyle(fontSize: textFontSize)),
                onPressed: () {
                  Navigator.pushNamed(context, '/known_bugs');
                },
              ),

            Padding(padding: EdgeInsets.only(top: paddingSize)),

            // About Us Page
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent[400], // background
                  onPrimary: Colors.black, // foreground
                ),
              child: Text("About Us", style: TextStyle(fontSize: textFontSize)),
              onPressed: () {
                Navigator.pushNamed(context, '/about_us');
              },
            ),

            Padding(padding: EdgeInsets.only(top: paddingSize, bottom: 200)),

            // logout button
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent[400], // background
                  onPrimary: Colors.black,
                  side: BorderSide(width: 2.0, color: Colors.black), // foreground
                ),
                child: Text("LogOut", style: TextStyle(fontSize: textFontSize),),
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
          backgroundColor: Colors.black,
          title: Text('Forget What?', style: TextStyle(fontSize: titleFontSize, color: fontColor)),
          actions: <Widget>[
            // add item button
            IconButton(
                icon: const Icon(Icons.add_circle, size: 40),
                tooltip: 'Add Item',
                onPressed: () {
                  Navigator.pushNamed(context, '/add_item');
                }),
          ]),


      body: ItemListDisplay(storage: Storage()),
    );
  }
}
