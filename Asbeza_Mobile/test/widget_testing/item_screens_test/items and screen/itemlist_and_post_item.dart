import 'package:asbeza_mobile_app/item/screens/itemList.dart';
import 'package:asbeza_mobile_app/item/screens/post_item_price.dart';
import 'package:asbeza_mobile_app/todo/screens/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
   testWidgets('check for scaffold in itemlist',
       (WidgetTester tester) async {
     await tester
         .pumpWidget(ItemList(),);

     final messageFinder = find.byType(Scaffold);

     expect(messageFinder, findsOneWidget);
   });

   testWidgets('check for appbar in itemlist', (WidgetTester tester) async {
     await tester
         .pumpWidget(ItemList());

      final messagee = find.byType(AppBar);

      expect(messagee, findsOneWidget);
   });
   testWidgets("ListView", (WidgetTester tester) async{
     await tester.pumpWidget(ItemList());
     final messages = find.byType(ListView);
     expect(messages, findsOneWidget);
   });

   testWidgets('GestureDetector', (WidgetTester tester) async{
     await tester.pumpWidget(MaterialApp(home: PostItemPriceScreen()));

     final search = find.byType(GestureDetector);
     expect(search, findsOneWidget);
   });
   testWidgets('splash screen', (WidgetTester tester) async {
     await tester.pumpWidget(ItemList());
     final splash = find.byType(Container);
     expect(splash, findsNWidgets(12));
   }); 

   testWidgets('DraggableScrollableSheet', (WidgetTester tester) async {
     await tester.pumpWidget(MyApp());
     final dragg = find.byType(DraggableScrollableSheet);
     expect(dragg, findsOneWidget);
   });
  
}
