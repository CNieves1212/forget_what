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

  // void copyDelete(itemData) {
  //   Map tempMap = itemData;
  //   print('before $allItemsList');
  //   for(Map item in allItemsList) {
  //     allItemsList.removeWhere((item) => item['itemName'] == itemData['itemName']);
  //   }
      
  //   print('after remove $allItemsList');

  //   allItemsList.add(tempMap);

  //   print('end $allItemsList');
  // }
  
  Map<String, dynamic> toJson() =>{
    'itemName': itemInfo['itemName'], 
    'itemCount': itemInfo['itemCount'], 
    'itemType': itemInfo['itemType'],
    'itemSubtractBy': itemInfo['itemSubtractBy'],
    'totalAmount': itemInfo['totalAmount'],
    'takenAmount': itemInfo['takenAmount'],

    'logOption': itemInfo['logOption'],
    //'itemLog': itemInfo['itemLog'],
    
    'notificationOption': itemInfo['notificationOption'],
    //'timerHowOften': itemInfo['timerHowOften'],
  };
}

 