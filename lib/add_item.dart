import 'package:flutter/material.dart';



class AddItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddItem();
}

class _AddItem extends State<AddItem> {
  final itemNameController = TextEditingController();
  final itemCountController = TextEditingController();
  final itemTypeController = TextEditingController();
  final itemSubtractByController = TextEditingController();

  String totalAmount;
  String takenAmount;
  double textBoxWidth = 100;
  double submitButtonWidth = 100;


  @override






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
                    'totalAmount': itemCountController.text,
                    'itemType': itemTypeController.text,
                    'itemSubtractBy': itemSubtractByController.text,
                    'takenAmount' : '0',
                  });
                },
              ),
            ),

          ]
      ),

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Row 1, Name and Type
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
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
                width: 200,
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
                width: 200,
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
                width: 200,
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
            width: 100,
            child: TextButton(
              child: Text("Submit"),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/home_page', (Route<dynamic> route) => false, arguments: {
                  'itemName': itemNameController.text,
                  'itemCount': itemCountController.text,
                  'itemType': itemTypeController.text,
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






