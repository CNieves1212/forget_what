import 'package:flutter/material.dart';
import 'package:forget_what/all_item_data.dart';



Widget customDetailsWidget(Map itemData, String dataKey, String preface) {
  String customData = itemData[dataKey]; 
  return Container(
    margin: EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 10),
    child: Text('$preface: $customData'),
    );
}

// need own widget to hide if logOption == false
Widget customLogOptionWidget(Map itemData, String preface) {
  if(itemData['logOption']) {
    return Row(
                  children: [
                    Container (
                      margin: EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 10),
                      child: TextButton(
                          child: Text(preface),
                          onPressed: () {
                            
                          },
                        ),
                    ),
                  ],);
  }
  else {
    return Placeholder(fallbackHeight: 0,fallbackWidth: 0, color: Colors.white,);
  }
}

Future<void> showMyDialog(context, itemData) async {
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Delete Item?'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Are you sure you want to delete this item?'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Approve'),
                                  onPressed: () {
                                    // actually delete item here
                                    allItemsList.removeWhere((item) => item['itemName'] == itemData['itemName']);
                                    
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Decline'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }

class ItemDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItemDetails();
}

class _ItemDetails extends State<ItemDetails> {    
@override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
      Map itemData = ModalRoute.of(context).settings.arguments;
      print(itemData);
      return Scaffold(
        appBar: AppBar(title: Text(itemData['itemName']),),
        body: 
          Column(
            children: [
            // Row 1: total
              Row(
                children: [
                  customDetailsWidget(itemData, 'totalAmount', 'Total Amount')
                ],),

              // Row 2: taken
              Row(
                children: [
                  customDetailsWidget(itemData, 'amountTaken', 'Amount Taken')
                ],),

          // Row 3: left
              Row(
                children: [
                  customDetailsWidget(itemData, 'amountLeft', 'Amount Left')
                ],),
              
              // Row 4: times taken log
              customLogOptionWidget(itemData, 'Times Taken Log'),

              // Row 5: Notification/Timer 
              

            // delete button
            Row (
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  child: const Icon(Icons.delete),
                  backgroundColor: Colors.red[700],
                  onPressed: () {
                    showMyDialog(context, itemData);
                  },
                ),
            ],)
          ] ,
          ),
      );
  }
}

