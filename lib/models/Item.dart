class Item {
  String itemName;
  String itemCount;
  String itemType;

  String itemSubtractBy;
  String totalAmount;
  String takenAmount;
  
  bool notificationOption;
  String notifHours;
  String notifMins;
  
// never had time to implement
 void itemSubtract(itemData) {
    
  }

  void itemAdd(itemData) {

  }
  
  Map<String, dynamic> toJson(

  ) =>{
    'itemName': itemName, 
    'itemCount': itemCount, 
    'itemType': itemType,
    
    'itemSubtractBy': itemSubtractBy,
    'totalAmount': totalAmount,
    'takenAmount': takenAmount,
    
    'notificationOption': notificationOption,
    'notifHours': notifHours,
    'notifMins': notifMins,
  };

  // all the following code handles manipulating 'data' to be storable and retrievable

  String itemToString() {
    String finalString;
    finalString = this.itemName + ' ' + // 0
                  this.itemCount + ' ' + // 1
                  this.itemType + ' ' + // 2
                  this.itemSubtractBy + ' ' + // 3
                  this.totalAmount + ' ' + // 4
                  this.takenAmount + ' ' + // 5
                  this.notificationOption.toString() + ' ' + // 6
                  this.notifHours + ' ' +
                  this.notifMins; // 7

    // print("itemToString final string is $finalString");
    return finalString;
  }

  List<String> stringToList(String itemAsString) {
    List<String> stringAsList = itemAsString.split(' ');
    // print(stringAsList);
    return stringAsList;
  }

  Map<String, dynamic> stringToMap(String itemAsString) {
    Item tempItem = new Item();
    List<String> stringAsList = stringToList(itemAsString);

    tempItem.itemName = stringAsList[0];
    tempItem.itemCount = stringAsList[1];
    tempItem.itemType = stringAsList[2];
    tempItem.itemSubtractBy = stringAsList[3];
    tempItem.totalAmount = stringAsList[4];
    tempItem.takenAmount = stringAsList[5];
    if(stringAsList[6] == 'true') {
      tempItem.notificationOption = true;
    }
    else {
      tempItem.notificationOption = false;
    }
    tempItem.notifHours = stringAsList[7];
    tempItem.notifMins = stringAsList[8];
    
    Map<String, dynamic> stringAsMap = tempItem.toJson();
    return stringAsMap;
  }
  
}

 