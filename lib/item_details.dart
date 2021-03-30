import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  static final valueKey = ValueKey('ItemDetails');
   ItemDetails({Key key, this.item}) : super(key: key);
   final String item;
  @override
  State<StatefulWidget> createState() => _ItemDetails();
}

class _ItemDetails extends State<ItemDetails> {    

  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
<<<<<<< Updated upstream
        appBar: AppBar(title: Text('ItemDetails'),),
<<<<<<< HEAD
        body:  Text(item),      
=======
        body:  Text("test"),
>>>>>>> a3fbb5a496afa8c7775152b7d83b8ff885e72f62
=======
        appBar: AppBar(title: Text(itemData['itemName']),),
        body: 
        Column(children: [
          // Row 1: Sub Title
          Row(children: [
            customTitleWidget('Total Amount'),
            TextButton(
              child: Text(itemData['itemCount']),
              //child: Text(itemData['totalAmount']),
            ),
          ],),
          // Row 2: Item amount and subtractBy amount
          Row(children: [
            customTitleWidget('Amount Taken'),
            TextButton(
              child: Text(itemData['takenAmount']),
            ),
          ],),
          // Row 3: Sub Title 2

          Row(children: [
            customTitleWidget('Amount Left'),
            TextButton(
              child: Text(itemData['itemCount']),
            ),
          ],),

        ],),
>>>>>>> Stashed changes
    );
  }
}

