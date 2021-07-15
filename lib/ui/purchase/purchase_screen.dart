import 'package:e_shop_flutter/data/local/models/item_view.dart';

import '../../data/local/models/purchase_view.dart';
import '../../res/assets/assets_provider.dart';
import '../main/main_cubit.dart';
import 'purchase_cubit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseScreen extends StatefulWidget {
  static const String tag = '/PurchaseScreen';

  PurchaseScreen({Key? key}) : super(key: key);

  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState
    extends BaseState<PurchaseScreen, PurchaseCubit, PurchaseState> {
  late PurchaseView _purchase;
  late MainCubit _mainCubit;

  @override
  void initState() {
    _mainCubit = context.read<MainCubit>();
    cubit = PurchaseCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)?.settings.arguments;
    if (argument is PurchaseView) {
      _purchase = argument;
    } else {
      throw 'You need to put PurchaseView before navigating to this screen';
    }

    cubit.loadItems(_purchase.id);

    return super.build(context);
  }

  Widget _listOfItems() => Expanded(
        child: ListView.builder(
            itemCount: cubit.items.length,
            itemBuilder: (context, pos) {
              ItemView item = cubit.items[pos];
              return ListTile(
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${item.count}',
                    style: GoogleFonts.roboto(
                        fontSize: 24, fontWeight: FontWeight.w100),
                  ),
                ),
                title: Text(
                  item.name,
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '${item.normalPrice} ₽',
                  style: GoogleFonts.roboto(
                      fontSize: 24, fontWeight: FontWeight.w300),
                ),
              );
            }),
      );

  Widget _todayAndSum() => Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_purchase.stringDate,
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w400)),
            Text('${_purchase.normalSum} ₽',
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w200))
          ],
        ),
      );

  Widget _purchaseName() => Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 250, maxWidth: 340),
                child: IntrinsicWidth(
                    stepWidth: 100,
                    child: Text(
                      _purchase.name,
                      style: GoogleFonts.roboto(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 8),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    icGoBack,
                    color: _mainCubit.themeIcColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _content() => Scaffold(
        body: SafeArea(
            child: Column(
          children: [_purchaseName(), _todayAndSum(), _listOfItems()],
        )),
      );

  @override
  Widget builder(BuildContext context, state) => _content();

  @override
  void listener(BuildContext context, state) {}
}
