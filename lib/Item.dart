List<Map<String, dynamic>> allItemsList = [];

class Item {
  String itemName;
  String itemCount;
  String itemType;

  String itemSubtractBy;
  String totalAmount;
  String takenAmount;
  
  bool logOption;
  List itemLog = [];
  
  bool notificationOption;
  String notifHowOften;
  
  // Map<String, dynamic> itemInfo = {
  //   'itemName': null, 
  //   'itemCount': null, 
  //   'itemType': null,
  //   'itemSubtractBy': null,
  //   'totalAmount': null,
  //   'takenAmount': null,

  //   'logOption': null,
  //   //'itemLog': itemLog,
    
  //   'notificationOption': null,
  //   //'timerHowOften': null,
    
  // };


 void itemSubtract(itemData) {
    
  }

  void itemAdd(itemData) {

  }

  void updateLog(itemData) {

  }
  
  Map<String, dynamic> toJson() =>{
    'itemName': itemName, 
    'itemCount': itemCount, 
    'itemType': itemType,
    
    'itemSubtractBy': itemSubtractBy,
    'totalAmount': totalAmount,
    'takenAmount': takenAmount,

    'logOption': logOption,
    'itemLog': itemLog,
    
    'notificationOption': itemLog,
    'notifHowOften': notifHowOften,
  };

  Map<String, dynamic> emptyJson() =>{
    'itemName': '', 
    'itemCount': '', 
    'itemType': '',
    
    'itemSubtractBy': '',
    'totalAmount': '',
    'takenAmount': '',

    'logOption': false,
    'itemLog': '',
    
    'notificationOption':false,
    'notifHowOften': '',
  };
}

 