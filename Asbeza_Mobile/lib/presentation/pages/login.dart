import 'package:asbeza_mobile_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// function for checking user name and password from api
Future getUser(Map body) async {
  return http
      .post(
          Uri.parse("http://10.0.2.2:5000/asbeza/api/v1/users/login"),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body))
      .then((http.Response response) {
          final int statusCode = response.statusCode;

          if (statusCode < 200 || statusCode > 400 || json == null) {
            throw new Exception("Error while fetching data");
          }
          
          return json.decode(response.body);
  });
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Form(
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
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
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    // Get input and validate values from api
                    User user = User(
                        name: nameController.text,
                        password: passwordController.text);
                    getUser(user.toMap()).then((value) {
                      if (value['message'] == 'logged in') {
                        // TODO: navigate to home page
                        print("logged in");
                      } else {
                        // TODO: display error message
                        print("not logged in");
                      }
                    });
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
                      "Login",
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
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Signup",
                      style: TextStyle(color: Colors.blue[400]),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
