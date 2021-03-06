import 'package:flutter/material.dart';

class KnownBugs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double titleFontSize = 32;
    double textFontSize = 24;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Known Bugs',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleFontSize, color: Colors.white),
        ),
      ),
      body: Container(
      child: Column(
        children: [
          Text(
            'Adding more than one item causes it to flash between previously added items\n\n' +
            'Deleting an item leaves an error message in its place because it can\'t find the item anymore\n\n' + 
            'All data is lost when restarting app\n\n' + 
            'Sometimes after logging in making a new account screen doesn\'t manually change to next page\n\n' +
            'Entering an empty item causes an error to appear listed as an item \n\n' +
            'Sometimes logging out requires app to be restarted to take effect',
            style: TextStyle(fontSize: textFontSize),
          ),  
        ],
      ),
      )   
    );
  }
}