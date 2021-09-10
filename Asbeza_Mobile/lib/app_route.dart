import 'package:asbeza_mobile_app/auth/models/models.dart';
import 'package:asbeza_mobile_app/auth/screens/login.dart';
import 'package:asbeza_mobile_app/auth/screens/profile.dart';
import 'package:asbeza_mobile_app/auth/screens/signup.dart';
import 'package:asbeza_mobile_app/auth/screens/update_profile.dart';
import 'package:asbeza_mobile_app/item/screens/item_add_update.dart';
import 'package:asbeza_mobile_app/item/screens/items_list.dart';
import 'package:flutter/material.dart';
import 'package:asbeza_mobile_app/item/models/models.dart';

class AsbezaAppRoute {
  static Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case ProfileApp.routeName:
        return MaterialPageRoute(builder: (context) => ProfileApp());

      case SignupScreen.routeName:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      
      case ItemList.routeName:
        return MaterialPageRoute(builder: (context) => ItemList());

      case PostItemPriceScreen.routeName:
        ItemArgument args = settings.arguments as ItemArgument;
        return MaterialPageRoute(builder: (context) => PostItemPriceScreen(args: args));

      case UpdateProfileScreen.routeName:
        UserArgument args = settings.arguments as UserArgument;
        return MaterialPageRoute(builder: (context) => UpdateProfileScreen(args: args));
    }
    
    return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}

class UserArgument {
  final NewUser? user;
  final bool? edit;
  final int? id;
  UserArgument({this.id, this.user, this.edit});
}

class ItemArgument {
  final Item? item;
  final bool edit;
  ItemArgument({this.item, required this.edit});
}
