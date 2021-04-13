List<Map<String, dynamic>> allItemsList = [];

class AllItemData {
  List itemLog = [];
  Map<String, dynamic> itemInfo = {
    'itemName': null, 
    'itemCount': null, 
    'itemType': null,
    'itemSubtractBy': null,
    'totalAmount': null,
    'takenAmount': null,

    'logOption': null,
    //'itemLog': itemLog,
    
    'notificationOption': null,
    //'timerHowOften': null,
    
  };


 void itemSubtract(itemData) {

    itemData['itemCount'] = (int.parse(itemData['itemCount']) -
            int.parse(itemData['itemSubtractBy'])).toString();
    itemData['takenAmount'] = (int.parse(itemData['takenAmount']) +
            int.parse(itemData['itemSubtractBy'])).toString();
    
  }

  void itemAdd(itemData) {
    

    itemData['itemCount'] = (int.parse(itemData['itemCount']) +
            int.parse(itemData['itemSubtractBy'])).toString();

  }

  void updateLog(itemData) {

  }
}

 