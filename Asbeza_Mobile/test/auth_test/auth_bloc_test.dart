import 'package:asbeza_mobile_app/item/screens/itemList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
   testWidgets('check for the text in the appbar',
       (WidgetTester tester) async {
     await tester
         .pumpWidget(ItemList(),);

     final messageFinder = find.byType(Scaffold);

     expect(messageFinder, findsOneWidget);
   });
}
