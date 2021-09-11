import 'package:asbeza_mobile_app/auth/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
   testWidgets("profile page checking the number of containers", (WidgetTester tester) async{
     await tester.pumpWidget(MaterialApp(home: ProfileApp()));
     final profile = find.byType(Card);
     expect(profile, findsOneWidget);
   });
}