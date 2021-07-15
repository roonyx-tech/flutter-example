import 'package:e_shop_flutter/ui/purchases/purchases_cubit.dart';

import '../../res/views/material_input_text.dart';
import '../../data/local/models/item_view.dart';
import 'add_item_dialog/additemdialog_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../res/assets/assets_provider.dart';
import 'addpurchase_cubit.dart';
import '../main/main_cubit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../base/base_state.dart';
import 'package:provider/provider.dart';

class AddPurchaseScreen extends StatefulWidget {
  static String tag = '/AddPurchaseScreen';

  @override
  _AddPurchaseState createState() => _AddPurchaseState();
}

class _AddPurchaseState
    extends BaseState<AddPurchaseScreen, AddPurchaseCubit, AddPurchaseState> {
  late MainCubit _mainCubit;
  late Function _fetchPurchases;

  @override
  void initState() {
    cubit = AddPurchaseCubit();
    _mainCubit = context.read<MainCubit>();
    super.initState();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  _showDeleteDialog(ItemView item) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      if (Navigator.canPop(context)) Navigator.pop(context);
                    },
                    child: Text(
                      'CANCEL',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    )),
                TextButton(
                    onPressed: () {
                      cubit.deleteItem(item..count = 0);
                      if (Navigator.canPop(context)) Navigator.pop(context);
                    },
                    child: Text(
                      'DELETE',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ))
              ],
              title: Text(
                'Are you sure you want to delete?',
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ));
  }

  _showAddDialog() {
    AddItemDialogCubit dialogCubit = AddItemDialogCubit();
    dialogCubit.validateName(cubit.itemNameText);
    dialogCubit.validatePrice(cubit.itemPriceText);
    showDialog(
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => dialogCubit,
            child: BlocConsumer<AddItemDialogCubit, AddItemDialogState>(
              listener: (context, state) {},
              builder: (context, state) {
                return AlertDialog(
                  title: Text(
                    'Add item',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MaterialInputText(
                        'Name...',
                        error: dialogCubit.nameException,
                        controller: cubit.itemNameController,
                        inputType: TextInputType.text,
                        onChanged: (value) => dialogCubit.validateName(value),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: MaterialInputText(
                            'Price...',
                            error: dialogCubit.priceException,
                            controller: cubit.itemPriceController,
                            inputType:
                                TextInputType.numberWithOptions(decimal: true),
                            onChanged: (value) =>
                                dialogCubit.validatePrice(value),
                          ))
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: dialogCubit.canAdd
                            ? () {
                                if (dialogCubit.validate()) {
                                  cubit.addItem();
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  }
                                }
                              }
                            : null,
                        child: Text(
                          'ADD',
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ))
                  ],
                );
              },
            ),
          );
        });
  }

  Widget _listOfItems() => Expanded(
        child: ListView.builder(
            itemCount: cubit.items.length,
            itemBuilder: (context, pos) {
              ItemView item = cubit.items[pos];
              return ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {
                          if (--item.count > 0) {
                            cubit.updateItemCounts(item);
                          } else {
                            item.count = 1;
                            _showDeleteDialog(item);
                          }
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.exposure_minus_1,
                                color: _mainCubit.themeIcColor))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${item.count}',
                        style: GoogleFonts.roboto(
                            fontSize: 24, fontWeight: FontWeight.w100),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          item.count++;
                          cubit.updateItemCounts(item);
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.plus_one,
                              color: _mainCubit.themeIcColor,
                            ))),
                  ],
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

  FloatingActionButton _floatingActionButton() => FloatingActionButton(
      child: Icon(Icons.add, color: Colors.black), onPressed: _showAddDialog);

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
                    child: MaterialInputText(
                      'Enter name...',
                      fontSize: 32,
                      controller: cubit.purchaseNameController,
                      inputType: TextInputType.text,
                      error: cubit.purchaseNameException,
                      onChanged: (value) => cubit.validatePurchaseName(),
                      textFontWeight: FontWeight.bold,
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

  Widget _save() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => cubit.save(),
          borderRadius: BorderRadius.circular(32),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.check,
              size: 48,
            ),
          ),
        ),
      );

  Widget _content() => Scaffold(
        floatingActionButton: _floatingActionButton(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _purchaseName(),
              _todayAndSum(),
              SizedBox(
                height: 16,
              ),
              _listOfItems(),
              if (cubit.canSave) _save()
            ],
          ),
        ),
      );

  @override
  Widget builder(BuildContext context, AddPurchaseState state) => _content();

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context)?.settings.arguments;

    if (argument is Function) {
      _fetchPurchases = argument;
    } else {
      throw 'You need to put a callback for fetching purchases on PurchasesPage';
    }

    return super.build(context);
  }

  @override
  void listener(BuildContext context, AddPurchaseState state) {
    if (state is PurchaseSaved) {
      _fetchPurchases.call();
      Navigator.pop(context);
    }
  }
}
