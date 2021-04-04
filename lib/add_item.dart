import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AddItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddItem();
}

class _AddItem extends State<AddItem> {
  final itemNameController = TextEditingController();
  final itemCountController = TextEditingController();
  String itemType;
  final itemSubtractByController = TextEditingController();

  double textBoxWidth = 200;
  double submitButtonWidth = 100;
  double pickerSize = 50;

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forget What?'),),
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
                width: textBoxWidth,
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
                width: textBoxWidth,
                child: 
                  CupertinoPicker(
                    onSelectedItemChanged: (int i) {
                      List typeList = ['Pills', 'oz','mg','mL'];
                      itemType = typeList[i];
                    },
                    itemExtent: pickerSize,
                    children: [
                      Text('Pills'),
                      Text('oz'),
                      Text('mg'),
                      Text('mL'),
                    ],
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
                width: textBoxWidth,
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
                width: textBoxWidth,
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
            width: submitButtonWidth,
            child: TextButton(
              child: Text("Submit"),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/home_page', (Route<dynamic> route) => false, arguments: {
                  'itemName': itemNameController.text,
                  'itemCount': itemCountController.text,
                  'itemType': itemType,
                  'itemSubtractBy': itemSubtractByController.text,
                });
              },
            ),
          ),

        ]
      ),      

    );
  }
}