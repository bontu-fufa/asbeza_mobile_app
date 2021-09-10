import 'package:asbeza_mobile_app/app_route.dart';
import 'package:asbeza_mobile_app/auth/blocs/auth_bloc.dart';
import 'package:asbeza_mobile_app/auth/blocs/blocs.dart';
import 'package:asbeza_mobile_app/auth/models/new_user_model.dart';
import 'package:asbeza_mobile_app/auth/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const routeName = 'editProfile';
  final UserArgument args;

  UpdateProfileScreen({required this.args});

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  bool hidePassword = true;

  final formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _user = {};
  String password = "";

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _user_name, _user_email;
  late Future<int> _user_id;
  late String name, email;
  late int id;

  @override
  void initState() {
    _user_name = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('user_name') ?? "");
    });
    _user_email = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('email') ?? "");
    });
    _user_id = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('user_id') ?? 0);
    });

    _user_name.then((value) {
      name = value;
    });

    _user_email.then((value) {
      email = value;
    });

    _user_id.then((value) {
      id = value;
    });

    super.initState();
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
                  FutureBuilder(
                    future: _user_name,
                    builder: (ctx, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        default:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return TextFormField(
                              initialValue: snapshot.data.toString(),
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
                              onSaved: (value) {
                                setState(() {
                                  this._user["user_name"] = value;
                                });
                              },
                            );
                          }
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: _user_email,
                    builder: (ctx, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        default:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return TextFormField(
                              initialValue: email,
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
                              onSaved: (value) {
                                setState(() {
                                  this._user["email"] = value;
                                });
                              },
                            );
                          }
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
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
                      if (password != "") {
                        if (password!.length < 8) {
                          return "Password too short";
                        }
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value ?? "";
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
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
                    validator: (String? value) {
                      if (password != value) {
                        return "Password doesn't match";
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        if (value != "") {
                          this._user["password"] = value;
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (ctx, authState) {
                      if (authState is AuthFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${authState.errorMsg}')));
                      }

                      if (authState is UpdatedProfile) {
                        // TODO: navigate to home page
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Updated successfully')));
                        Navigator.of(context).pushReplacementNamed(ProfileApp.routeName);
                        // Navigator.of(context).pop();
                      }
                    },
                    builder: (ctx, authState) {
                      Widget buttonChild = Text("Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ));

                      if (authState is SignupInProgress) {
                        buttonChild = SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          // run validations
                          final valid = formKey.currentState!.validate();
                          final form = formKey.currentState;
                          if (!valid) {
                            // do something here.
                            print("something failed");
                            return;
                          }
                          if (form != null && form.validate()) {
                            form.save();
                            final username = _user["user_name"];
                            final email = _user["email"];
                            final password = _user["password"];

                            // Get input and add user to db via api
                            NewUser newUser = NewUser(
                              name: username,
                              email: email,
                              password: password,
                            );

                            BlocProvider.of<AuthBloc>(context).add(
                                UpdateProfileEvent(id: id, newUser: newUser));
                          }
                        },
                        child: Container(
                          height: 60.0,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: buttonChild,
                        ),
                      );
                    },
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
