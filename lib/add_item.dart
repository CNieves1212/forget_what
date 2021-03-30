import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddItem();
}

class _AddItem extends State<AddItem> {
<<<<<<< Updated upstream
=======
  final itemNameController = TextEditingController();
  final itemCountController = TextEditingController();
  final itemTypeController = TextEditingController();
  final itemSubtractByController = TextEditingController();
<<<<<<< Updated upstream
  double textboxwidth = 100;
=======
  double widthsize = 100;
>>>>>>> Stashed changes




@override
  void initState() {
    super.initState();
  }

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget What?'),),
<<<<<<< Updated upstream
      body: Text("Hello World"),      
=======
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Row 1, Name and Type
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
<<<<<<< Updated upstream
                width: textboxwidth,
=======
                width: widthsize,
>>>>>>> Stashed changes
                child: 
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    controller: itemNameController,
                    
                  ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, top: 10, right: 25, bottom: 10),
<<<<<<< Updated upstream
                width: textboxwidth,
=======
                width: widthsize,
>>>>>>> Stashed changes
                child: 
                  TextField( // replace with a scrolling picker
                    decoration: InputDecoration(
                      hintText: 'Type',
                      border: OutlineInputBorder(),
                    ),
                    controller: itemTypeController,
                    
                  ),
              ),
            ],

          ),
          ),

          // Row 2, Count and SubtractBy
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
<<<<<<< Updated upstream
                width: textboxwidth,
=======
                width: widthsize,
>>>>>>> Stashed changes
                child: 
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Count',
                      border: OutlineInputBorder(),
                    ),
                    controller: itemCountController,
                  ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, top: 10, right: 25, bottom: 10),
<<<<<<< Updated upstream
                width: textboxwidth,
=======
                width: widthsize,
>>>>>>> Stashed changes
                child: 
                  TextField( // replace with a scrolling picker
                    decoration: InputDecoration(
                      hintText: 'Subtract By',
                      border: OutlineInputBorder(),
                    ),
                    controller: itemSubtractByController,
                    
                  ),
              ),
            ],

          ),
          ),


          // Submit Button 
          Container(
<<<<<<< Updated upstream
            width: textboxwidth,
=======
            width: widthsize,
>>>>>>> Stashed changes
            child: TextButton(
              child: Text("Submit"),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/home_page', (Route<dynamic> route) => false, arguments: {
                  'itemName': itemNameController.text,
                  'itemCount': itemCountController.text,
                  //'totalAmount': itemCountController.text,
                  'itemType': itemTypeController.text,
                  'itemSubtractBy': itemSubtractByController.text,
                });
              },
            ),
          ),

        ]
      ),      
>>>>>>> Stashed changes

    );
  }
}