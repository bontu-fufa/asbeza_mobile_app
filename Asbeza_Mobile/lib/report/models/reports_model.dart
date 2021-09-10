class Report {
  String description, itemName, location, status, reporter;
  int likeCount;
  DateTime date;

  Report({
    required this.description,
    required this.itemName,
    required this.status,
    required this.location,
    required this.reporter,
    required this.likeCount,
    required this.date,
  });
}
