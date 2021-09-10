import 'package:asbeza_mobile_app/item/screens/item_add_update.dart';
import 'package:asbeza_mobile_app/item/screens/items_list.dart';
import 'package:flutter/material.dart';
import 'package:asbeza_mobile_app/item/models/models.dart';

class ItemAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => ItemList());
    }

    if (settings.name == PostItemPriceScreen.routeName) {
      ItemArgument args = settings.arguments as ItemArgument;
      return MaterialPageRoute(
        builder: (context) => PostItemPriceScreen(
          args: args,
        ),
      );
    }

  //   if (settings.name == CourseDetail.routeName) {
  //     Course course = settings.arguments as Course;
  //     return MaterialPageRoute(
  //       builder: (context) => CourseDetail(
  //         course: course,
  //       ),
  //     );
  //   }

    return MaterialPageRoute(builder: (context) => ItemList());
  }
}

// class CourseArgument {
//   final Course? course;
//   final bool edit;
//   CourseArgument({this.course, required this.edit});
// }


class ItemArgument {
  final Item? item;
  final bool edit;
  ItemArgument({this.item, required this.edit});
}