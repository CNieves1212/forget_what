import 'package:flutter/material.dart';
import 'package:forget_what/services/storage.dart';
class ItemDetails extends StatefulWidget {
  final Storage storage;
  ItemDetails({Key key, @required this.storage}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ItemDetails();
}

double titleFontSize = 32;
double textFontSize = 24;

Widget customDetailsWidget(Map itemData, String dataKey, String preface) {
  String customData = itemData[dataKey];
  return Container(
    margin: EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 10),
    child:
        Text('$preface: $customData', style: TextStyle(fontSize: textFontSize)),
  );
}

Future<void> showMyDialog(context, itemData) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Item?', style: TextStyle(fontSize: textFontSize)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want to delete this item?', style: TextStyle(fontSize: textFontSize)),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve', style: TextStyle(fontSize: textFontSize)),
            onPressed: () {
              // actually delete item here
              Storage().deleteFile(itemData['itemName']);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Decline', style: TextStyle(fontSize: textFontSize)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class _ItemDetails extends State<ItemDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map itemData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(itemData['itemName'],
            style: TextStyle(fontSize: titleFontSize)),
      ),
      body: Column(
        children: [
          // Row 1: total
          Row(
            children: [
              customDetailsWidget(itemData, 'totalAmount', 'Total Amount')
            ],
          ),

          // Row 2: taken
          Row(
            children: [
              customDetailsWidget(itemData, 'amountTaken', 'Amount Taken')
            ],
          ),

          // Row 3: left
          Row(
            children: [
              customDetailsWidget(itemData, 'amountLeft', 'Amount Left')
            ],
          ),

          // Row 5: Notification/Timer

          // delete button
          Row(
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
            ],
          )
        ],
      ),
    );
  }
}
