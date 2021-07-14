import 'package:bloc/bloc.dart';
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

  List<PurchaseView> _purchases = [];
  List<PurchaseView> get purchases => _purchases;

  final PurchaseRepository _repository = getIt.get<PurchaseRepository>();

  void init() async {
    _purchases = await _repository.getPurchases();
    emit(PurchasesList(_purchases));
  }

  void addPurchase(BuildContext context) {
    Navigator.pushNamed(context, AddPurchaseScreen.tag, arguments: this);
  }

  String getSumByDate(String date) {
    return '${_purchases.where((element) => element.stringDate == date).map((e) => e.sum).toList().sum()}'
        .getDecimalValue();
  }
}
