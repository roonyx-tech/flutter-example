import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/data/local/interactors/purchase_interactor.dart';
import 'package:e_shop_flutter/ui/purchase/purchase_screen.dart';
import '../../data/local/models/purchase_view.dart';
import '../../data/local/repositories/purchase_repository.dart';
import '../../di/modules.dart';
import 'package:e_shop_flutter/utils/list_extensions.dart';
import 'package:e_shop_flutter/utils/string_extensions.dart';
import '../add_purchase/addpurchase_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'purchases_state.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  PurchasesCubit() : super(PurchasesInitial());

  final PurchaseInteractor _interactor = getIt.get<PurchaseInteractor>();

  List<PurchaseView> _purchases = [];
  List<PurchaseView> get purchases => _purchases;

  String getSumByDate(String date) =>
      '${_purchases.where((element) => element.stringDate == date).map((e) => e.sum).toList().sum()}'
          .getDecimalValue();

  void fetch() async {
    _purchases = await _interactor.getPurchases();
    emit(PurchasesList([..._purchases]));
  }

  void delete(PurchaseView purchase) async {
    await _interactor.deletePurchase(purchase);
    fetch();
  }

  void addPurchase(BuildContext context) =>
      Navigator.pushNamed(context, AddPurchaseScreen.tag, arguments: fetch);

  void goToPurchase(BuildContext context, PurchaseView purchase) =>
      Navigator.pushNamed(context, PurchaseScreen.tag, arguments: purchase);
}
