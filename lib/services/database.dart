import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:forget_what/models/item_model.dart';

class DatabaseService {

  final String currentUID;
  DatabaseService({this.currentUID});

  // collection reference
  final CollectionReference userIDCollection = FirebaseFirestore.instance.collection('allUsers');
  
  Future updateUserData() async {
    return await userIDCollection.doc(currentUID).collection("itemData").add({
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
    });
  }

  // get itemList stream
  Stream<List<ItemModel>> get itemList {
    try {
      print(userIDCollection.doc(currentUID).collection("itemData").doc('ZYvTcpmQ1z3NumeFdrcz').collection('itemName'));
      return userIDCollection.doc(currentUID).collection("itemData").snapshots().map(_itemListFromSnapshot);
    } 
    catch(e) {e.toString();
    return null;}
  }
    // userIDCollection.doc(currentUID).collection("itemData").snapshots()

    // gets list of items from snapshot
    // map cycles through firebase list and assigns it to our itemModel
    // for easy access later
    List<ItemModel> _itemListFromSnapshot(QuerySnapshot snapshot) {
      return snapshot.docs.map((doc){
        return ItemModel(
          itemName: doc.data()['itemName'] ?? '',
          itemCount: doc.data()['itemCount'] ?? '',
          itemType: doc.data()['itemType'] ?? 'Pills',

          itemSubtractBy: doc.data()['itemSubtractBy'] ?? '',
          totalAmount: doc.data()['totalAmount'] ?? '',
          takenAmount: doc.data()['takenAmount'] ?? '',

          logOption: doc.data()['logOption'] ?? false,
          itemLog: doc.data()['itemLog'] ?? '',
          notificationOption: doc.data()['notificationOption'] ?? false,
          notifHowOften: doc.data()['notifHowOften'] ?? '',
        );
      }).toList();
    }
}