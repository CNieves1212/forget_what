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
        appBar: AppBar(title: Text('ItemDetails'),),
<<<<<<< HEAD
        body:  Text(item),      
=======
        body:  Text("test"),
>>>>>>> a3fbb5a496afa8c7775152b7d83b8ff885e72f62
    );
  }
}

