import 'purchase_item_model.dart';

class Todo{
  final int? id;
  final int userId;
  final PurchaseItem item;
  final bool isPurchased; 

  Todo({this.id, required this.userId, required this.item, required this.isPurchased});

  factory Todo.fromJson(Map json, PurchaseItem item) {
    return Todo(
      item: item,
      userId: json["user_id"],
      isPurchased: json["is_purchased"] == 0? false : true
    );
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["item_id"] = item.id;
    map["user_id"] = userId;
    map["is_purchased"] = isPurchased;

    return map;
  }
}