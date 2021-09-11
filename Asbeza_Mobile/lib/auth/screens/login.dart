import 'package:asbeza_mobile_app/auth/blocs/blocs.dart';
import 'package:asbeza_mobile_app/auth/models/user_model.dart';
import 'package:asbeza_mobile_app/auth/screens/profile.dart';
import 'package:asbeza_mobile_app/auth/screens/signup.dart';
import 'package:asbeza_mobile_app/user_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;

  final formKey = GlobalKey<FormState>();
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
          key: formKey,
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
                  validator: (String? name) {
                    if (name == "") return "Enter username";
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
                    if (password == "") return "Enter password";
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

                  if (authState is LoggedIn) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Logged in successfully')));

                    Navigator.of(context).pushNamed(
                      UserHomepage.routeName,
                    );
                  }
                }, builder: (ctx, authState) {
                  Widget buttonChild = Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ));

                  if (authState is LoginInProgress) {
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
                      if (!valid) {
                        // do something here.
                        print("something failed");
                        return;
                      }
                      // Get input and validate values from api
                      User user = User(
                        name: nameController.text,
                        password: passwordController.text,
                      );
                      BlocProvider.of<AuthBloc>(context)
                          .add(LoginEvent(user: user));
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
                  );
                }),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(SignupScreen.routeName);
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Colors.blue[400]),
                      ),
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
