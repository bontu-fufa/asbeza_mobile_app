import 'package:asbeza_mobile_app/auth/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
   testWidgets('check for the text in the appbar',
       (WidgetTester tester) async {
     await tester
         .pumpWidget(MaterialApp(home: ProfileApp(),));

     final messageFinder = find.byType(AppBar);

     expect(messageFinder, findsOneWidget);
   });
}
