import 'package:asbeza_mobile_app/app_route.dart';
import 'package:asbeza_mobile_app/auth/blocs/auth_bloc.dart';
import 'package:asbeza_mobile_app/auth/data_providers/auth-data-provider.dart';
import 'package:asbeza_mobile_app/auth/repository/auth-repository.dart';
import 'package:asbeza_mobile_app/item/screens/admin_item_list.dart';
import 'package:asbeza_mobile_app/item/screens/item_add_update.dart';
import 'package:asbeza_mobile_app/item/screens/items_list.dart';
import 'package:asbeza_mobile_app/report/models/reports_model.dart';
import 'package:asbeza_mobile_app/report/screens/report_filter.dart';
import 'package:asbeza_mobile_app/report/screens/send_report.dart';
import 'package:asbeza_mobile_app/todo/blocs/todo_bloc.dart';
import 'package:asbeza_mobile_app/todo/data_providers/todo_data_provider.dart';
import 'package:asbeza_mobile_app/todo/repository/todo_repository.dart';
import 'package:asbeza_mobile_app/todo/screens/goods_list.dart';
import 'package:asbeza_mobile_app/todo/screens/goods_list_details.dart';
import 'package:asbeza_mobile_app/todo/screens/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
testWidgets('check for list view widget ', (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: MyHomePage()));
  final drag = find.byType(Container);
  expect(drag, findsWidgets);
});

testWidgets('check for number of ListTile', (WidgetTester tester) async{
  await tester.pumpWidget(MaterialApp(home: MyHomePage()));
  final tile = find.byType(ListTile);
  expect(tile, findsNWidgets(4));
});

testWidgets('check for the number of stack', (WidgetTester tester) async{
  await tester.pumpWidget(MaterialApp(home: MyHomePage()));
  final stac = find.byType(Stack);
  expect(stac, findsNWidgets(3));
});

}