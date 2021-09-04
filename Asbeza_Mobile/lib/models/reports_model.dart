class ReportModel {
  String description, itemName, location, status, reporter;
  int likeCount;
  DateTime date;

  ReportModel({
    required this.description,
    required this.itemName,
    required this.status,
    required this.location,
    required this.reporter,
    required this.likeCount,
    required this.date,
  });
}
