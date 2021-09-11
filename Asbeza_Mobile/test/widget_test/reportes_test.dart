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
import 'package:asbeza_mobile_app/todo/screens/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
testWidgets('DraggableScrollableSheet', (WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(home: AdminItemList()));
  final drag = find.byType(GestureDetector);
  expect(drag, findsNWidgets(4));
});


testWidgets("check for Scaffold", (WidgetTester tester) async{
  await tester.pumpWidget(MaterialApp(home: AdminItemList()));
  final scaf = find.byType(Scaffold);
  expect(scaf, findsOneWidget);
});

testWidgets('check for appbar widget',  (WidgetTester tester) async{
  await tester.pumpWidget(MaterialApp(home: AdminItemList()));
  final appbarr = find.byType(AppBar);
  expect(appbarr, findsOneWidget);
});

testWidgets('checking the iconbutton', (WidgetTester tester)async{
  await tester.pumpWidget(MaterialApp(home: AdminItemList()));
  final containerr = find.byType(IconButton);
  expect(containerr, findsOneWidget);
});

testWidgets('check the number of rows', (WidgetTester tester) async{
  await tester.pumpWidget(MaterialApp(home: ReportFilter()));
  final rep = find.byType(Row);
  expect(rep, findsNWidgets(19));

});
testWidgets('check the number of rows', (WidgetTester tester) async{
  await tester.pumpWidget(MaterialApp(home: ReportFilter()));
  final rep = find.byType(Report);
  expect(rep, findsNothing);

});

testWidgets('check the number of columns', (WidgetTester tester) async{
await tester.pumpWidget(MaterialApp(home: SendReport()));
final colu = find.byType(Column);
expect(colu, findsNWidgets(4));
});

}