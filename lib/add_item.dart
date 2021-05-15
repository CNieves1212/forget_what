import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:forget_what/services/authentication_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Item.dart';

class AddItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddItem();
}

class _AddItem extends State<AddItem> {
  final db = FirebaseFirestore.instance;
  final currentUID = AuthenticationService().getUID();


  final itemNameController = TextEditingController();
  final itemCountController = TextEditingController();
  String itemType = 'Pills'; // Pills default value, if not set passes null

  final itemSubtractByController = TextEditingController();
  String totalAmount = '0';
  String takenAmount = '0';

  bool logOption = false; // needs to start initialized for switch

  bool notificationOption = false; // needs to start initialized for switch
  final notifHowOftenController = TextEditingController(); // every x hour reminders


  double textBoxWidth = 100;
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
                    child: CupertinoPicker(
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

            // Row , keep log switch
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Keep Log?'),
                  CupertinoSwitch(
                    value: logOption,
                    onChanged: (bool) {
                      setState(() {
                        logOption = !logOption;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Row 4, notification/timer option
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Timer?'),
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
                    child:
                    TextField(
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
              child: TextButton(
                child: Text("Submit"),
                onPressed: () async {
                  Item currentItem = new Item();
                  currentItem.itemName = itemNameController.text;
                  currentItem.itemCount = itemCountController.text;
                  currentItem.totalAmount = itemCountController.text;
                  currentItem.itemType = itemType;
                  currentItem.itemSubtractBy = itemSubtractByController.text;
                  currentItem.takenAmount = '0';

                  currentItem.logOption = logOption;

                  currentItem.notificationOption = notificationOption;
                  currentItem.notifHowOften = '0';
                  Navigator.pushNamedAndRemoveUntil(context, '/home_page', (Route<dynamic> route) => false);

                  
                  // adds to the folder allUsers which adds a folder under the currentUID 
                  // and then adds a folder itemData under that if it doesn't exist
                  await db.collection("allUsers").doc(currentUID).collection("itemData").add(currentItem.toJson());
                },
              ),
            ),

          ]
      ),
    );
  }
}






