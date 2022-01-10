// ignore: overridden_fields
import 'package:e_shop_flutter/ui/purchase/purchase_screen.dart';
import 'package:flutter/material.dart';

import '../ui/add_purchase/addpurchase_screen.dart';
import '../ui/main/logic/main_cubit.dart';
import '../ui/purchases/purchases_screen.dart';
import 'base/base_state.dart';

// ignore: must_be_immutable
class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends BaseState<Application, MainCubit, MainState> {
  @override
  Widget builder(BuildContext context, MainState state) => MaterialApp(
        initialRoute: PurchasesPage.tag,
        routes: {
          PurchasesPage.tag: (context) => PurchasesPage(),
          AddPurchaseScreen.tag: (context) => AddPurchaseScreen(),
          PurchaseScreen.tag: (context) => const PurchaseScreen()
        },
        theme: cubit.themeData,
        debugShowCheckedModeBanner: false,
      );

  @override
  void listener(BuildContext context, MainState state) {
    if (state is PurchasesThemeChanged) {
      debugPrint('Theme changed: ${state.themeState.getValue()}');
    }
  }
}
