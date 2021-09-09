import 'package:asbeza_mobile_app/auth/models/new_user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

// function for checking user name and password from api
Future addNewUser(Map body) async {
  return http
      .post(Uri.parse("http://10.0.2.2:5000/asbeza/api/v1/users"),
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

class _SignupScreenState extends State<SignupScreen> {
  bool hidePassword = true;

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
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
                      hintText: "Password",
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
                      final valid = formKey.currentState!.validate();
                      if (!valid) {
                        // do something here.
                        print("something failed");
                        return;
                      }

                      final username = usernameController.text;
                      final email = emailController.text;
                      final password = passwordController.text;

                      // Get input and add user to db via api
                      NewUser newUser = NewUser(
                        name: username,
                        email: email,
                        password: password,
                      );
                      addNewUser(newUser.toMap()).then((value) {
                        if (value['name'] != null) {
                          // TODO: navigate to home page
                          print("User signed up successfully");
                        } else {
                          // TODO: display error message
                          print("User not signed up");
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
