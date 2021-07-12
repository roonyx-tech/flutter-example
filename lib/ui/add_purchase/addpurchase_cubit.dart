import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'addpurchase_state.dart';

class AddPurchaseCubit extends Cubit<AddpurchaseState> {
  AddPurchaseCubit() : super(AddpurchaseInitial());

  // Data
  TextEditingController _purchaseNameController = TextEditingController();

  TextEditingController get purchaseNameController => _purchaseNameController;


}
