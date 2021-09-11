import 'package:asbeza_mobile_app/auth/data_providers/auth-data-provider.dart';
import 'package:asbeza_mobile_app/auth/repository/auth-repository.dart';
import 'package:asbeza_mobile_app/auth/screens/login.dart';
import 'package:asbeza_mobile_app/item/blocs/blocs.dart';
import 'package:asbeza_mobile_app/item/data_providers/item-data-provider.dart';
import 'package:asbeza_mobile_app/item/repository/item-repository.dart';
import 'package:asbeza_mobile_app/app_route.dart';
import 'package:asbeza_mobile_app/item/screens/items_list.dart';
import 'package:asbeza_mobile_app/todo/blocs/blocs.dart';
import 'package:asbeza_mobile_app/todo/data_providers/todo_data_provider.dart';
import 'package:asbeza_mobile_app/todo/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asbeza_mobile_app/auth/blocs/blocs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'item/blocs/item_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository =
      AuthRepository(dataProvider: AuthDataProvider());
  final ItemRepository itemRepository =
      ItemRepository(dataProvider: ItemDataProvider());
  final TodoRepository todoRepository =
      TodoRepository(dataProvider: TodoDataProvider());

  @override
  Widget build(BuildContext context) {
    late final userId;
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value) {
      if (value.containsKey('user_id')) {
        userId = value.getInt('user_id');
      }
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => AuthBloc(authRepository: this.authRepository),
        ),
        BlocProvider(
          create: (ctx) =>
              ItemBloc(itemRepository: this.itemRepository)..add(ItemLoad()),
        ),
        BlocProvider(
          create: (ctx) =>
              TodoBloc(todoRepository: this.todoRepository)..add(LoadTodo(userId: userId)),
        ),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AsbezaAppRoute.generateRoute,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value) {
      if (value.containsKey("user_id")) {
        Timer(Duration(seconds: 1), () {
          Navigator.of(context).pushReplacementNamed(ItemList.routeName);
        });
      } else {
        Timer(Duration(seconds: 1), () {
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Asbeza Tracking App",
              style: TextStyle(fontSize: 35, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
