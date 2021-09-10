import 'package:asbeza_mobile_app/app_route.dart';
import 'package:asbeza_mobile_app/auth/blocs/auth_bloc.dart';
import 'package:asbeza_mobile_app/auth/blocs/auth_state.dart';
import 'package:asbeza_mobile_app/auth/blocs/blocs.dart';
import 'package:asbeza_mobile_app/auth/models/models.dart';
import 'package:asbeza_mobile_app/auth/screens/login.dart';
import 'package:asbeza_mobile_app/auth/screens/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApp extends StatefulWidget {
  static const routeName = 'profile';

  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
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
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue.shade400, Colors.blue.shade400]),
                ),
                child: Container(
                  width: double.infinity,
                  height: 350.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 28),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue[800],
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
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
                                  return Text(
                                    "${snapshot.data.toString().toUpperCase()}",
                                    style: TextStyle(
                                        fontSize: 32.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  );
                                }
                            }
                          },
                        ),
                        SizedBox(
                          height: 10.0,
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
                                  return Text(
                                    "${snapshot.data.toString()}",
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.grey[200],
                                    ),
                                  );
                                }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 45.0, horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      final user = NewUser(name: name, email: email);
                      Navigator.of(context).pushNamed(
                          UpdateProfileScreen.routeName,
                          arguments: UserArgument(id: id, user: user));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 22),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.grey[850],
                          size: 32,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (ctx, authState) {
                      if (authState is DeletedAccount) {
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Deleted account successfully')));
                        Navigator.of(ctx)
                            .pushReplacementNamed(LoginScreen.routeName);
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context).add(DeleteAccountEvent(id: id));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delete Account",
                            style: TextStyle(fontSize: 22),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.grey[850],
                            size: 32,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (ctx, authState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Logged out')));
                        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (_) => false);
                    },
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Logout",
                            style: TextStyle(fontSize: 22),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.grey[850],
                            size: 32,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
