import 'dart:convert';

import 'package:asbeza_mobile_app/auth/models/new_user_model.dart';
import 'package:asbeza_mobile_app/auth/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataProvider {
  static final String _baseUrl = "http://10.0.2.2:5000/asbeza/api/v1";

  // method for signup
  Future<NewUser> create(NewUser newUser) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    final http.Response response = await http.post(Uri.parse("$_baseUrl/users"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "user_name": newUser.name,
          "email": newUser.email,
          "password": newUser.password,
          "user_type": "user",
        }));

    if (response.statusCode == 200) {
      return NewUser.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create user");
    }
  }

  // method for login
  Future<dynamic> fetchByName(User user) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

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

  Future<dynamic> update(int id, NewUser newUser) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);
    try {
      final http.Response response =
          await http.put(Uri.parse("$_baseUrl/users/${id}"),
              headers: {
                "Content-Type": "application/json",
                "X-Access-Token": await tokenString,
              },
              body: jsonEncode(
                {
                  "user_name": newUser.name,
                  "email": newUser.email,
                  "password": newUser.password,
                  "user_type": newUser.userType,
                },
              ));

      if (response.statusCode == 200) {
        return NewUser.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to update user");
      }
    } catch (e) {
      print(e);
    }
  }

  Future delete(int id) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);

    try {
      final http.Response response = await http.delete(
        Uri.parse("$_baseUrl/users/${id}"),
        headers: {
          "Content-Type": "application/json",
          "X-Access-Token": await tokenString,
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
