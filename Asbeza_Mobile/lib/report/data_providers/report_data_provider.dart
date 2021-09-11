import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:asbeza_mobile_app/report/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future addToSession(Map value) async {
  final SharedPreferences prefs = await _prefs;
  return prefs;
}

class ReportDataProvider {
  // static final String _baseUrl = "http://10.0.2.2:5000/asbeza/api/v1/reports";
  static final String _baseUrl = "http://127.0.0.1:5000/asbeza/api/v1/reports";

  // method for creating report
  Future<Report> create(Report report) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: {
          "Content-Type": "application/json",
          'x-access-token': await tokenString,
        },
        body: jsonEncode({
          "location": report.location,
          "description": report.location,
          "status": report.status,
          "like_counts": report.like_counts,
          "reportet_id": report.reporter_id,
          "item_id": report.item_id
        }));

    if (response.statusCode == 200) {
      return Report.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create Report");
    }
  }

  // method for fetching all reports
  Future<List<Report>> fetchAll() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);

    final response = await http.get(Uri.parse("$_baseUrl/all"), headers: {
      'content-type': 'application/json',
      'x-access-token': await tokenString,
    });
    if (response.statusCode == 200) {
      final reports = jsonDecode(response.body) as List;
      print(reports);
      return reports.map((c) => Report.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch reports");
    }
  }

  // method for fetching all user's reports
  Future<List<Report>> fetchAllOfUser() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);

    final response = await http.get(Uri.parse(_baseUrl), headers: {
      'content-type': 'application/json',
      'x-access-token': await tokenString,
    });
    if (response.statusCode == 200) {
      final reports = jsonDecode(response.body) as List;
      print(reports);
      return reports.map((c) => Report.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch reports");
    }
  }

  // method to fetching one report
  Future<Report> fetchOne(int id, Report report) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);

    final response = await http.get(Uri.parse("$_baseUrl/$id"), headers: {
      "Content-Type": "application/json",
      "X-Access-Token": await tokenString,
    });
    print(tokenString.runtimeType);
    if (response.statusCode == 200) {
      return Report.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not fetch the report");
    }
  }

  // method to update report info
  Future<Report> update(int id, Report report) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);

    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: {
          "Content-Type": "application/json",
          "X-Access-Token": await tokenString,
        },
        body: jsonEncode({
          "id": report.id,
          "description": report.description,
          "location": report.location,
          "status": report.status,
          "reporter_id": report.reporter_id,
          "item_id": report.item_id,
        }));
    print(tokenString.runtimeType);
    if (response.statusCode == 200) {
      return Report.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the report");
    }
  }

  // method to delete an report
  Future<void> delete(int id) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);

    final response = await http.delete(Uri.parse("$_baseUrl/$id"), headers: {
      "Content-Type": "application/json",
      'x-access-token': await tokenString,
    });
    if (response.statusCode != 200) {
      throw Exception("Failed to delete the report");
    }
  }
}
