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
          TextField(
            controller: _textFieldController,
            decoration: InputDecoration(labelText: 'Enter Item'),
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
@override
Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Forget What?'),),
        body:  searchForm(),      

    );
  }

    
    
}

