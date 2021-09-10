class Item{
  final int? id;
  final String name;
  final int max_price;
  final int min_price;

  Item({required this.id, required this.name, required this.max_price, required this.min_price});

  factory Item.fromJson(Map json) {
    return Item(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      max_price: json['max_price'] ?? 0,
      min_price: json['min_price'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["max_price"] = max_price;
    map["min_price"] = min_price;

    return map;
  }
}