class ItemModel {
  final String itemName;
  final String itemCount;
  final String itemType;

  final String itemSubtractBy;
  final String totalAmount;
  final String takenAmount;
  
  final bool logOption;
  final List itemLog;
  
  final bool notificationOption;
  final String notifHowOften;

  ItemModel({
    this.itemName,
    this.itemCount,
    this.itemType,

    this.itemSubtractBy,
    this.totalAmount,
    this.takenAmount,

    this.logOption,
    this.itemLog,

    this.notificationOption,
    this.notifHowOften,
  });
}