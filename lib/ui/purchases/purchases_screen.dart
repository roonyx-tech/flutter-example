import '../main/main_cubit.dart';

import '../../res/assets/assets_provider.dart';
import '../../data/local/database.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'purchases_cubit.dart';

class PurchasesPage extends StatefulWidget {
  static String tag = '/PurchasesPage';

  @override
  _PurchasesPageState createState() => _PurchasesPageState();
}

class _PurchasesPageState
    extends BaseState<PurchasesPage, PurchasesCubit, PurchasesState> {
  List<PurchaseData> _purchases = [];
  late MainCubit _mainCubit;

  @override
  void initState() {
    cubit = PurchasesCubit()..init();
    _mainCubit = context.read<MainCubit>();
    super.initState();
  }

  Widget _purchasesRv() => ListView.builder(
      itemCount: _purchases.length,
      itemBuilder: (context, pos) {
        var purchase = _purchases[pos];
        return ListTile(
          title: Text(purchase.name),
        );
      });

  Widget _header() => Container(
        margin: EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Purchases',
              style:
                  GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _mainCubit.changeThemeMode(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  _mainCubit.themeIc,
                  color: _mainCubit.themeIcColor,
                  width: 32,
                  height: 32,
                ),
              ),
            )
          ],
        ),
      );

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      onPressed: () => cubit.addPurchase(context),
      child: SvgPicture.asset(icShoppingCart),
    );
  }

  Widget _content() => Scaffold(
        floatingActionButton: _buildFAB(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [_header(), Expanded(child: _purchasesRv())],
          ),
        ),
      );

  @override
  Widget builder(BuildContext context, PurchasesState state) => _content();

  @override
  void listener(BuildContext context, PurchasesState state) {
    if (state is PurchasesList) {
      _purchases = state.list;
    }
  }
}
