import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:forget_what/services/authentication_services.dart';
import 'Item.dart';
import 'package:forget_what/services/storage.dart';
import 'package:flutter/foundation.dart';

List<String>  fileNames = [];

class AddItem extends StatefulWidget {
  final Storage storage;
  AddItem({Key key, @required this.storage}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AddItem();
}

class _AddItem extends State<AddItem> {
  final currentUID = AuthenticationService().getUID();


  final itemNameController = TextEditingController();
  final itemCountController = TextEditingController();
  String itemType = 'Pills'; // Pills default value, if not set passes null

  final itemSubtractByController = TextEditingController();
  String totalAmount = '0';
  String takenAmount = '0';


  bool notificationOption = false; // needs to start initialized for switch
  final notifHowOftenController = TextEditingController(); // every x hour reminders

  double titleFontSize = 32;
  double textFontSize = 24;
  double textBoxWidth = 150;
  double textBoxHeight = 75;
  double submitButtonWidth = 150;
  double submitButtonHeight = 50;
  double pickerSize = 50;

  @override
    void initState() {
      super.initState();
      
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Item', style: TextStyle(fontSize: titleFontSize)),),
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
                    height: textBoxHeight,
                    child:
                    TextField(
                      style: TextStyle(fontSize: textFontSize),
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
                    child: CupertinoPicker(
                      onSelectedItemChanged: (int i) {
                      List typeList = ['Pills', 'oz','mg','mL'];
                      itemType = typeList[i];
                    },
                      itemExtent: pickerSize,
                      children: [
                        Text('Pills', style: TextStyle(fontSize: titleFontSize)),
                        Text('oz', style: TextStyle(fontSize: titleFontSize)),
                        Text('mg', style: TextStyle(fontSize: titleFontSize)),
                        Text('mL', style: TextStyle(fontSize: titleFontSize)),
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
                    height: textBoxHeight,
                    child:
                    TextField(
                      style: TextStyle(fontSize: textFontSize),
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
                    height: textBoxHeight,
                    child:
                    TextField(
                      style: TextStyle(fontSize: textFontSize),
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

            // Row 3, notification/timer option
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Timer?', style: TextStyle(fontSize: textFontSize)),
                  CupertinoSwitch(
                    value: notificationOption,
                    onChanged: (bool) {
                      setState(() {
                        notificationOption = !notificationOption;
                      });
                    },
                  ),
                  Container(
                    width: textBoxWidth,
                    height: textBoxHeight,
                    child:
                    TextField(
                      style: TextStyle(fontSize: textFontSize),
                      decoration: InputDecoration(
                        hintText: 'How Often',
                        border: OutlineInputBorder(),
                      ),
                      controller: notifHowOftenController,

                    ),
                  ),
                ],
              ),
            ),

            // Submit Button
            Container(
              width: submitButtonWidth,
              height: submitButtonHeight,
              child: ElevatedButton(
                child: Text("Submit", style: TextStyle(fontSize: titleFontSize)),
                onPressed: () async {
                  Item currentItem = new Item();
                  currentItem.itemName = itemNameController.text;
                  currentItem.itemCount = itemCountController.text;
                  currentItem.totalAmount = itemCountController.text;
                  currentItem.itemType = itemType;
                  currentItem.itemSubtractBy = itemSubtractByController.text;
                  currentItem.takenAmount = '0';

                  // currentItem.logOption = logOption;

                  currentItem.notificationOption = notificationOption;
                  currentItem.notifHowOften = '0';


                  // print("local path when adding item is");
                  // String testLocalPath ='';
                  // Storage().localPath.then((String localpath){
                  //   setState(() {
                  //     testLocalPath = localpath;
                  //   });
                  //   print(localpath);
                  // });
                  fileNames.add(currentItem.itemName);
                  //print(fileNames);
                  Storage().writeData(currentItem.itemName, currentItem.itemToString());
                  // print(currentItem.itemToString());
                  // print(currentItem.stringToList(currentItem.itemToString()));

                  

                  Navigator.pushNamedAndRemoveUntil(context, '/home_page', (Route<dynamic> route) => false);
                },
              ),
            ),

          ]
      ),
    );
  }
}






