import 'dart:convert';

import 'package:asbeza_mobile_app/todo/models/models.dart';

class Report {
  String description;
  String location;
  String status;
  String reporter_id;
  String? date;
  int likeCount;
  int id;
  PurchaseItem item;

  Report({
    required this.description,
    required this.location,
    required this.status,
    required this.reporter_id,
    this.date,
    required this.likeCount,
    required this.id,
    required this.item,
  });

  factory Report.fromJson(Map json, PurchaseItem item) {
    return Report(
        item: item,
        description: json["description"],
        location: json["location"],
        status: json['status'],
        reporter_id: json['reporter_id'],
        likeCount: json['like_counts'],
        id: json['id']
      );
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['description'] = description;
    map['item_id'] = item.id;
    map['like_counts'] = likeCount;
    map['location'] = location;
    map['reporter_id'] = reporter_id;
    map['status'] = status;

    return map;
  }
}
      