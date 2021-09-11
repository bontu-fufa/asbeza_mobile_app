import 'package:asbeza_mobile_app/report/models/reports_model.dart';
import 'package:asbeza_mobile_app/report/screens/report.dart';
import 'package:asbeza_mobile_app/report/screens/report_filter.dart';
import 'package:asbeza_mobile_app/todo/screens/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ReportModel', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ReportFilter()));
    final splash = find.byType(TextButton);
    expect(splash, findsNWidgets(4));
   });
testWidgets('appbar checker', (WidgetTester tester) async{
  await tester.pumpWidget(SendReport());
  final appbarr = find.byType(AppBar);
  expect(appbarr, findsOneWidget);
});
testWidgets('scaffold checker', (WidgetTester tester) async {
  await tester.pumpWidget(SendReport());
  final scaffoldd = find.byType(Scaffold);
  expect(scaffoldd, findsOneWidget);
});
testWidgets('DraggableScrollableSheet', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
  final drag = find.byType(DraggableScrollableSheet);
  expect(drag, findsOneWidget);
});
}