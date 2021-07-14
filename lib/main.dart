import 'package:e_shop_flutter/ui/add_purchase/addpurchase_screen.dart';
import 'ui/main/main_cubit.dart';
import 'base/base_state.dart';
import 'ui/purchases/purchases_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends BaseState<MyApp, MainCubit, MainState> {
  @override
  void initState() {
    cubit = MainCubit()..init();
    super.initState();
  }

  @override
  Widget builder(BuildContext context, MainState state) {
    return MaterialApp(
      initialRoute: PurchasesPage.tag,
      routes: {
        PurchasesPage.tag: (context) => PurchasesPage(),
        AddPurchaseScreen.tag: (context) => AddPurchaseScreen(),
      },
      theme: cubit.themeData,
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  void listener(BuildContext context, MainState state) {}
}
