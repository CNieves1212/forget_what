import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItemDetails();
}

class _ItemDetails extends State<ItemDetails> {    

Map itemData;


@override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
      Map itemData = ModalRoute.of(context).settings.arguments;

      // Style to make sub titles look better
      Widget customTitleWidget(String subTitle) {
        return Row(
          children: [
            Text(subTitle),
          ],
        );
      }

      return Scaffold(
        appBar: AppBar(title: Text(itemData['itemName']),),
        body: 
          Column(
            children: [
            // Row 1: Sub Title
              Row(
                children: [
                  customTitleWidget('Total Amount'),
                ],
              ),
              // Row 2: Sub Title 1
              Row(
                children: [
                  customTitleWidget('Amount Taken'),
                ],
              ),
          // Row 3: Sub Title 2
              Row(
                children: [
                  customTitleWidget('Amount Left'),
                ],
            ),
          ] ,
          ),
      );
  }
}

