class Report1 {
  String description, itemName, location, status, reporter;
  int likeCount;
  DateTime date;

  Report1({
    required this.description,
    required this.itemName,
    required this.status,
    required this.location,
    required this.reporter,
    required this.likeCount,
    required this.date,
  });
}

class Report {
  final int? id;
  final String location;
  final String description;
  final String status;
  final int like_counts;
  final int reporter_id;
  final int item_id;

  Report(
      {required this.id,
      required this.location,
      required this.description,
      required this.status,
      required this.like_counts,
      required this.reporter_id,
      required this.item_id});

  factory Report.fromJson(Map json) {
    return Report(
        id: json['id'] ?? 0,
        location: json['location'] ?? "",
        description: json['descripotion'] ?? "",
        status: json['status'] ?? "",
        like_counts: json['like_counts'] ?? 0,
        reporter_id: json['reporter_id'] ?? 0,
        item_id: json['item_id'] ?? 0);
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["location"] = location;
    map["description"] = description;
    map["status"] = status;
    map["like_counts"] = like_counts;
    map["reporter_id"] = reporter_id;

    return map;
  }
}
