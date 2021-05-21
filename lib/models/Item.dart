import 'package:forget_what/services/storage.dart';

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

String itemEditToString(Map item, bool flag) { // true means add, false means subtract
    if(flag) {
      item['itemCount'] = (int.parse(item['itemCount']) + int.parse(item['itemSubtractBy'])).toString();
      item['totalAmount'] = (int.parse(item['totalAmount']) + int.parse(item['itemSubtractBy'])).toString();
    }
    else {
      item['itemCount'] = (int.parse(item['itemCount']) - int.parse(item['itemSubtractBy'])).toString();
      item['totalAmount'] = (int.parse(item['totalAmount']) - int.parse(item['itemSubtractBy'])).toString();
      item['takenAmount'] = (int.parse(item['takenAmount']) + int.parse(item['itemSubtractBy'])).toString();
    }

    String finalString;
    finalString = item['itemName'] + ' ' + // 0
                  item['itemCount'] + ' ' + // 1
                  item['itemType'] + ' ' + // 2
                  item['itemSubtractBy'] + ' ' + // 3
                  item['totalAmount'] + ' ' + // 4
                  item['takenAmount'] + ' ' + // 5
                  item['notificationOption'].toString() + ' ' + // 6
                  item['notifHours'] + ' ' +
                  item['notifMins']; // 7

    // print("itemToString final string is $finalString");
    return finalString;
  }

 // never had time to implement
 void itemSubtract(Map item) {
    String itemAsString = itemEditToString(item, false);
    Storage().writeData(item['itemName'], itemAsString, 0);
  }

  void itemAdd(Map item) {
    String itemAsString = itemEditToString(item, true);
    Storage().writeData(item['itemName'], itemAsString, 0);
  }