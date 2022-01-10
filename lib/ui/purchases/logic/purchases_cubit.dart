import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/core/data/local/interactors/purchase_interactor.dart';
import 'package:e_shop_flutter/core/data/local/models/purchase_view.dart';
import 'package:e_shop_flutter/core/utils/list_extensions.dart';
import 'package:e_shop_flutter/core/utils/string_extensions.dart';
import 'package:e_shop_flutter/ui/main/logic/main_cubit.dart';
import 'package:e_shop_flutter/ui/purchase/purchase_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../add_purchase/addpurchase_screen.dart';

part 'purchases_state.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  final PurchaseInteractor _purchaseInteractor;
  final MainCubit _mainCubit;

  PurchasesCubit({
    required PurchaseInteractor purchaseInteractor,
    required MainCubit mainCubit,
  })  : _purchaseInteractor = purchaseInteractor,
        _mainCubit = mainCubit,
        super(PurchasesInitial()) {
    fetch();
  }

  final List<PurchaseView> purchases = [];

  Color get stickyHeaderColor => _mainCubit.backgrpundColor;
  Color get themeIcColor => _mainCubit.themeIcColor;
  String get themeIc => _mainCubit.themeIc;

  String getSumByDate(String date) =>
      '${purchases.where((element) => element.stringDate == date).map((e) => e.sum).toList().sum()}'
          .getDecimalValue();

  void changeTheme() => _mainCubit.changeThemeMode();

  void fetch() => _purchaseInteractor.getPurchases().then(
        (list) {
          purchases.clear();
          purchases.addAll(list);
          emit(PurchasesList([...purchases]));
        },
      );

  void delete(PurchaseView purchase) =>
      _purchaseInteractor.deletePurchase(purchase).then(
        (value) {
          fetch();
        },
      );

  void addPurchase(BuildContext context) =>
      Navigator.pushNamed(context, AddPurchaseScreen.tag, arguments: fetch);

  void goToPurchase(BuildContext context, PurchaseView purchase) =>
      Navigator.pushNamed(context, PurchaseScreen.tag, arguments: purchase);
}
