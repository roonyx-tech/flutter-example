import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/data/local/database.dart';
import 'package:e_shop_flutter/data/local/repositories/purchase_repository.dart';
import 'package:e_shop_flutter/ui/add_purchase/addpurchase_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'purchases_state.dart';

class PurchasesCubit extends Cubit<PurchasesState> {
  PurchasesCubit() : super(PurchasesInitial());

  PurchaseRepository _repository = PurchaseRepository.getInstance();

  void init() async {
    emit(PurchasesList(await _repository.getPurchases()));
  }

  void addPurchase(BuildContext context) {
    Navigator.pushNamed(context, AddPurchaseScreen.TAG);
  }
}
