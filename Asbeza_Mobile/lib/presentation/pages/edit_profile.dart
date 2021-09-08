import 'package:asbeza_mobile_app/models/new_user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

// function for updating user info with api
Future updateUser(Map body) async {
  
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _user_id = await _prefs.then((SharedPreferences prefs) => (prefs.getInt("user_id") ?? 0));

  return http
      .put(Uri.parse("http://10.0.2.2:5000/asbeza/api/v1/users/$_user_id"),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body))
      .then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while posting data");
    }

    return json.decode(response.body);
  });
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool hidePassword = true;

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _user_name, _email, _password;
  late Future<int> _user_id;

  @override
  void initState() {
    super.initState();
    _user_name = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('user_name') ?? "");
    });
    _email = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('email') ?? "");
    });
    _password = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('password') ?? "");
    });
    _user_id = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('user_id') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Form(
          key: formKey,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    // initialValue: ,
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    validator: (String? name) {
                      if (name == "") {
                        return "Enter username";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    validator: (String? email) {
                      if (email == "") {
                        return "Enter email";
                      }
                      if (!email!.contains('@')) {
                        return "Invalid email";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: hidePassword ? true : false,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        padding: EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: hidePassword
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      hintText: "New password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    validator: (String? password) {
                      if (password == "") {
                        return "Enter password";
                      }
                      if (password!.length < 8) {
                        return "Password too short";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: hidePassword ? true : false,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        padding: EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: hidePassword
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    validator: (String? password) {
                      if (password == "") {
                        return "Enter password again";
                      }
                      if (passwordController.text != password) {
                        return "Password doesn't match";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      // run validations
                      // final valid = formKey.currentState!.validate();
                      // if (!valid) {
                      //   // do something here.
                      //   print("something failed");
                      //   return;
                      // }

                      final username = usernameController.text;
                      final email = emailController.text;
                      final password = passwordController.text;

                      // Get input and update user via api
                      NewUser newUser = NewUser(
                        name: username,
                        email: email,
                        password: password,
                      );

                      updateUser(newUser.toMap()).then((value) => null);
                    },
                    child: Container(
                      height: 60.0,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.blue[400]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
