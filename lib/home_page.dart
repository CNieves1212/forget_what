import 'package:flutter/material.dart';
// testing 
class HomePage extends StatefulWidget {
  static final valueKey = ValueKey('HomePage');

  HomePage({Key key, this.searchForTerm}) : super(key: key);
  final ValueChanged<String> searchForTerm;
  
  @override
  State<StatefulWidget> createState() => _HomePage();
  }
  


  class _HomePage extends State<HomePage> {
    

    final _textFieldController = TextEditingController();

    void _search() {
      widget.searchForTerm(_textFieldController.text);
    }
  
    Widget searchForm() {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
<<<<<<< Updated upstream
          TextField(
            controller: _textFieldController,
            decoration: InputDecoration(labelText: 'Enter Item'),
=======
          Row(
            children: [
              TextButton(
                child: Text(itemData['itemName']),
                onPressed: () {
                  //pushes to item details page
                  Navigator.pushNamed(context, '/item_details', arguments: {
                    'itemName': itemData['itemName'],
                    //'totalAmount': itemData['totalAmount'],
                    'itemCount': itemData['itemCount'],
                    'itemType': itemData['itemType'],
                    'itemSubtractBy': itemData['itemSubtractBy'],
                    'takenAmount': itemData['takenAmount'],
                  });
                },
              ),
              IconButton( //subtract button
                icon: const Icon(Icons.remove),
                iconSize: iconSize,

                onPressed: () {
                  setState(() {
                    itemData['itemCount'] = (int.parse(itemData['itemCount']) - int.parse(itemData['itemSubtractBy'])).toString();
                    itemData['takenAmount'] = (int.parse(itemData['takenAmount']) + int.parse(itemData['itemSubtractBy'])).toString();
                  });
                },
              ),
              Text(itemData['itemCount']),
              Text(itemData['itemType']),
              IconButton( //add button
                icon: const Icon(Icons.add_sharp),
                iconSize: iconSize,

                onPressed: () {
                  setState(() {
                    itemData['itemCount'] = (int.parse(itemData['itemCount']) + int.parse(itemData['itemSubtractBy'])).toString();
                    //itemData['takenAmount'] = (int.parse(itemData['takenAmount']) - int.parse(itemData['itemSubtractBy'])).toString();
                  });
                },
              ),
            ],
>>>>>>> Stashed changes
          ),
          TextButton(
          onPressed: () => _search(),
          //color: Colors.purple,
          //textColor: Colors.white,            
          child: Text("Search"))
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
}
<<<<<<< Updated upstream
=======




@override //overrides what's already there
  void initState() {// initializes the state of the page
    super.initState();
  }


>>>>>>> Stashed changes
@override
Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Forget What?'),),
        body:  searchForm(),      

<<<<<<< Updated upstream
    );
=======
  itemData = ModalRoute.of(context).settings.arguments;
  // setState(() {
  //   itemList[itemData['itemName']] = itemData;
  // });

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Forget What?'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_circle),
          tooltip: 'Add Item',
          onPressed: () {
            Navigator.pushNamed(context, '/add_item'); //move between pages
          }
        )
      ]
    ),
    
    body:  
     Column(
       children: [
         Row(
           children: [
             if(itemData != null && itemData.length > 0) //doesn't add somethingwithnull
             buildNewItem(),
           ],
         ),
       ],
     ),
            

);
>>>>>>> Stashed changes
  }

    
    
}

