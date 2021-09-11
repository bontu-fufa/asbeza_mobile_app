class ReportAll {
  final description;
  final location;
  final status;
  final reporter_id;
  String? date;
  final likeCount;
  final id;
  final itemId;
  final itemName;
  final min_price;
  final max_price;

  ReportAll(
      {this.date,
      required this.description,
      required this.location,
      required this.status,
      required this.reporter_id,
      required this.likeCount,
      required this.id,
      required this.itemId,
      required this.itemName,
      required this.min_price,
      required this.max_price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'item_id': itemId,
      'max_price': max_price,
      'min_price': min_price,
      'like_counts': likeCount,
      'location': location,
      'reporter_id': reporter_id,
      'status': status,
      'item_name': itemName
    };
  }

  factory ReportAll.fromJson(Map<String, dynamic> json) {
    return ReportAll(
      description: json["description"],
      location: json["location"],
      status: json['status'],
      reporter_id: json['reporter_id'],
      likeCount: json['like_counts'],
      id: json['id'],
      itemId: json['item_id'],
      itemName: json['item_name'],
      max_price: json['max_price'],
      min_price: json['min_price'],
    );
  }
}
