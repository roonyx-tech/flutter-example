import 'package:flutter_svg/svg.dart';

import 'base/assets_provider.dart';
import 'ui/purchases/purchases_cubit.dart';
import 'ui/purchases/purchases_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PurchasesCubit _purchasesCubit;

  @override
  void initState() {
    _purchasesCubit = PurchasesCubit();
    super.initState();
  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      onPressed: () => _purchasesCubit.addPurchase(),
      child: SvgPicture.asset(IC_SHOPPING_CART),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _purchasesCubit,
        child: BlocConsumer<PurchasesCubit, PurchasesState>(
          listener: (context, state) {
            if (state is PurchasesThemeChanged) {
              debugPrint('${state.themeState.getAssert()}');
            }
          },
          builder: (context, state) {
            return MaterialApp(
              theme: _purchasesCubit.themeData,
              home: Scaffold(
                  body: SafeArea(child: PurchasesPage()),
                  floatingActionButton: _buildFAB()),
              debugShowCheckedModeBanner: false,
            );
          },
        ));
  }
}
