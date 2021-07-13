import 'package:e_shop_flutter/data/local/database.dart';

import '../../base/assets_provider.dart';
import 'addpurchase_cubit.dart';
import '../main/main_cubit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../base/base_state.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../../utils/string_extensions.dart';

class AddPurchaseScreen extends StatefulWidget {
  static String TAG = '/AddPurchaseScreen';

  @override
  _AddPurchaseState createState() => _AddPurchaseState();
}

class _AddPurchaseState
    extends BaseState<AddPurchaseScreen, AddPurchaseCubit, AddPurchaseState> {
  late MainCubit _mainCubit;

  @override
  void initState() {
    cubit = AddPurchaseCubit();
    _mainCubit = context.read<MainCubit>();
    super.initState();
  }

  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Add item',
              style:
                  GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: cubit.itemNameController,
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: new InputDecoration(
                      hintStyle: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      hintText: "Name..."),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: cubit.itemPriceController,
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    decoration: new InputDecoration(
                        hintStyle: GoogleFonts.roboto(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        hintText: "Price..."),
                  ),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    cubit.addItem();
                    if (Navigator.canPop(context)) Navigator.pop(context);
                  },
                  child: Text(
                    'ADD',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ))
            ],
          );
        });
  }

  Widget _listOfItems() => Expanded(
        child: ListView.builder(
            itemCount: cubit.items.length,
            itemBuilder: (context, pos) {
              ItemData item = cubit.items[pos];
              var price = '${item.price * item.count}'.getDecimalValue();
              return ListTile(
                title: Text(
                  item.name,
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '$price ₽',
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
            InkWell(
              onTap: () => cubit.pickDate(context),
              child: Text(cubit.date,
                  style: GoogleFonts.roboto(
                      fontSize: 24, fontWeight: FontWeight.w400)),
            ),
            Text('${cubit.sum} ₽',
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w200))
          ],
        ),
      );

  FloatingActionButton _floatingActionButton() =>
      FloatingActionButton(child: Icon(Icons.add), onPressed: _showAddDialog);

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
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: cubit.purchaseNameController,
                    style: GoogleFonts.roboto(
                        fontSize: 32, fontWeight: FontWeight.bold),
                    decoration: new InputDecoration(
                        hintStyle: GoogleFonts.roboto(
                            fontSize: 32, fontWeight: FontWeight.bold),
                        hintText: "Enter name..."),
                  ),
                ),
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
                    IC_GO_BACK,
                    color: _mainCubit.themeIcColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _content() => Scaffold(
        floatingActionButton: _floatingActionButton(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [_purchaseName(), _todayAndSum(), _listOfItems()],
          ),
        ),
      );

  @override
  Widget builder(BuildContext context, AddPurchaseState state) => _content();

  @override
  void listener(BuildContext context, AddPurchaseState state) {}
}
