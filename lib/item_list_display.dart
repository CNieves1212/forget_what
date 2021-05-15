import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:forget_what/models/item_model.dart';

class ItemListDisplay extends StatefulWidget {
  @override
  _ItemListDisplayState createState() => _ItemListDisplayState();
}

class _ItemListDisplayState extends State<ItemListDisplay> {
  @override
  Widget build(BuildContext context) {

    final itemList = Provider.of<List<ItemModel>>(context);


    double iconSize = 24;

  // build individual cards for each item 
  Widget buildItemCard(ItemModel item) {
    print(item);
    if(item == null) {
      return Text("Add New Item!");
    }
    return Container(
      child: Row(
        children: [
          TextButton(
            child: Text(item.itemName),
            onPressed: () {
              Navigator.pushNamed(context, '/item_details', arguments: item);
            },
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            iconSize: iconSize,
            onPressed: () {
              setState(() {
                // AllItemData().itemSubtract(oneItem);
                // AllItemData().updateLog(oneItem);
              });
            },
          ),
          Text(item.itemCount),
          Text('  '),
          Text(item.itemType),
          IconButton(
            icon: const Icon(Icons.add_sharp),
            iconSize: iconSize,
            onPressed: () {
              setState(() {
                // AllItemData().itemAdd(oneItem);
              });
            },
          ),
        ],
      ),
    );
  }

    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return buildItemCard(itemList[index]);
      },
    );
  }
}
