import 'dart:convert';

import 'package:asbeza_mobile_app/auth/models/new_user_model.dart';
import 'package:asbeza_mobile_app/auth/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthDataProvider {
  static final String _baseUrl = "http://10.0.2.2:5000/asbeza/api/v1/users";

  // method for signup
  Future<NewUser> create(NewUser newUser) async {
    final http.Response response = await http.post(Uri.parse("$_baseUrl"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "user_name": newUser.name,
          "email": newUser.email,
          "password": newUser.password,
          "user_type": "normal",
        }));

    if (response.statusCode == 200) {
      return NewUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create user");
    }
  }

  // method for login
  Future<dynamic> fetchByName(User user) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/login"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Fetching user by name failed");
    }
  }

  // Future<List<Course>> fetchAll() async {
  //   final response = await http.get(Uri.parse(_baseUrl));
  //   if (response.statusCode == 200) {
  //     final courses = jsonDecode(response.body) as List;
  //     return courses.map((c) => Course.fromJson(c)).toList();
  //   } else {
  //     throw Exception("Could not fetch courses");
  //   }
  // }

  // Future<Course> update(int id, Course course) async {
  //   final response = await http.put(Uri.parse("$_baseUrl/$id"),
  //       headers: <String, String>{"Content-Type": "application/json"},
  //       body: jsonEncode({
  //         "id": id,
  //         "code": course.code,
  //         "title": course.title,
  //         "ects": course.ects,
  //         "description": course.description
  //       }));

  //   if (response.statusCode == 200) {
  //     return Course.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("Could not update the course");
  //   }
  // }

  // Future<void> delete(int id) async {
  //   final response = await http.delete(Uri.parse("$_baseUrl/$id"));
  //   if (response.statusCode != 204) {
  //     throw Exception("Field to delete the course");
  //   }
  // }
}
