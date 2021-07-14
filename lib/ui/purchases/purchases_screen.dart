import 'package:e_shop_flutter/data/local/models/purchase_view.dart';
import 'package:e_shop_flutter/res/colors/base_colors.dart';
import 'package:e_shop_flutter/utils/pair.dart';

import '../main/main_cubit.dart';

import '../../res/assets/assets_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
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
  late MainCubit _mainCubit;

  @override
  void initState() {
    cubit = PurchasesCubit()..init();
    _mainCubit = context.read<MainCubit>();
    super.initState();
  }

  Widget _purchasesRv() => GroupedListView<PurchaseView, Pair<String, String>>(
        elements: cubit.purchases,
        groupBy: (element) => Pair<String, String>(
            element.stringDate, cubit.getSumByDate(element.stringDate)),
        sort: false,
        groupSeparatorBuilder: (pair) => Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pair.first,
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w400),
              ),
              Text(
                '${pair.second} ₽',
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
        itemBuilder: (context, PurchaseView purchase) => ListTile(
          title: Text(
            purchase.name,
            style:
                GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            '${purchase.normalSum} ₽',
            style:
                GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w200),
          ),
        ),
        separator: Container(
          height: 1,
          margin: EdgeInsets.only(left: 32, right: 32),
          color: Colors.white10,
        ),
        stickyHeaderBackgroundColor: _mainCubit.backgrpundColor,
        useStickyGroupSeparators: true, // optional
        floatingHeader: false, // opt// optional
      );

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
  void listener(BuildContext context, PurchasesState state) {}
}
