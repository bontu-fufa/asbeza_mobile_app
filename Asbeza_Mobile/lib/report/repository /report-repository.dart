import 'package:asbeza_mobile_app/report/data_providers/report_data_provider.dart';
import 'package:asbeza_mobile_app/report/models/models.dart';

class ReportRepository {
  final ReportDataProvider dataProvider;
  ReportRepository({required this.dataProvider});

  Future<Report> create(Report report) async {
    return this.dataProvider.create(report);
  }

  Future<Report> update(int id, Report report) async {
    return this.dataProvider.update(id, report);
  }

  Future<Report> fetchOne(int id, Report report) async {
    return this.dataProvider.fetchOne(id, report);
  }

  Future<List<Report>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<List<Report>> fetchAllOfUser() async {
    return this.dataProvider.fetchAllOfUser();
  }

  Future<void> delete(int id) async {
    this.dataProvider.delete(id);
  }
}
