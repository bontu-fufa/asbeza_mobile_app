import 'package:asbeza_mobile_app/app_route.dart';
import 'package:asbeza_mobile_app/auth/blocs/auth_bloc.dart';
import 'package:asbeza_mobile_app/auth/data_providers/auth-data-provider.dart';
import 'package:asbeza_mobile_app/auth/repository/auth-repository.dart';
import 'package:asbeza_mobile_app/item/blocs/item_bloc.dart';
import 'package:asbeza_mobile_app/item/data_providers/item-data-provider.dart';
import 'package:asbeza_mobile_app/item/repository/item-repository.dart';
import 'package:asbeza_mobile_app/item/screens/item_add_update.dart';
import 'package:asbeza_mobile_app/report/screens/report_filter.dart';
import 'package:asbeza_mobile_app/report/screens/send_report.dart';
import 'package:asbeza_mobile_app/todo/screens/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ReportModel', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ReportFilter()));
    final splash = find.byType(TextButton);
    expect(splash, findsNWidgets(4));
   });
// testWidgets('appbar checker', (WidgetTester tester) async{
//   await tester.pumpWidget(SendReport());
//   final appbarr = find.byType(AppBar);
//   expect(appbarr, findsOneWidget);
// });
// testWidgets('scaffold checker', (WidgetTester tester) async {
//   await tester.pumpWidget(SendReport());
//   final scaffoldd = find.byType(Scaffold);
//   expect(scaffoldd, findsOneWidget);
// });
testWidgets('DraggableScrollableSheet', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
  final drag = find.byType(DraggableScrollableSheet);
  expect(drag, findsOneWidget);
});







testWidgets('Testing the button of signin', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<ItemBloc>(
            create: (context) => ItemBloc(
                itemRepository: ItemRepository(dataProvider: ItemDataProvider())
          ),)
          // BlocProvider(
          //     create: (context) =>
          //         HomePageBloc(repository: homePageRepository)),
        ],
        child: MaterialApp(
          home: PostItemPriceScreen(args: ItemArgument(edit: true),),
        ),
      ),
    );
    var button = find.text("Sign In");
    expect(button, findsNothing);
  });
}
