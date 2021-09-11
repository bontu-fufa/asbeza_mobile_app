class PurchaseItem {
  final int id;
  final String name;
  final double max_price;
  final double min_price;

  PurchaseItem({
    required this.id,
    required this.name,
    required this.max_price,
    required this.min_price,
  });

  factory PurchaseItem.fromJson(Map map) {
    return PurchaseItem(
      id: map['id'],
      name: map['name'],
      max_price: map['max_price'],
      min_price: map['min_price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'max_price': max_price,
      'min_price': min_price,
    };
  }
}
