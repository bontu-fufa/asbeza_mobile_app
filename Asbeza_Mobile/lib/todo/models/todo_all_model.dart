class TodoAll {
  final int? userId;
  final int itemId;
  final String name;
  final double max_price;
  final double min_price;
  final bool isPurchased; 
  TodoAll({
    this.userId,
    required this.itemId,
    required this.name,
    required this.max_price,
    required this.min_price,
    required this.isPurchased,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId ?? 0,
      'item_id': itemId,
      'name': name,
      'max_price': max_price,
      'min_price': min_price,
      'is_purchased': isPurchased,
    };
  }

  factory TodoAll.fromJson(Map<String, dynamic> map) {
    return TodoAll(
      userId: map['user_id'],
      itemId: map['item_id'],
      name: map['name'],
      max_price: map['max_price'],
      min_price: map['min_price'],
      isPurchased: map['is_purchased'] == 0? false: true,
    );
  }
}
