import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/core/base/exceptions.dart';

import 'package:equatable/equatable.dart';

part 'add_item_dialog_state.dart';

class AddItemDialogCubit extends Cubit<AddItemDialogState> {
  AddItemDialogCubit() : super(AddItemdialogInitial());

  // Data
  ValueException? _nameException;
  ValueException? get nameException => _nameException;

  ValueException? _priceException;
  ValueException? get priceException => _priceException;

  bool get canAdd => _nameException == null && _priceException == null;

  bool validateName(String name) {
    _nameException =
        name.isEmpty ? ValueException(ValueExceptionType.empty) : null;
    emit(NameErrorException(_nameException));
    return _nameException == null;
  }

  bool validatePrice(String price) {
    _priceException = double.tryParse(price) == null
        ? ValueException(ValueExceptionType.cantParse)
        : null;
    emit(PriceErrorException(_priceException));
    return _priceException == null;
  }

  bool validate() => _nameException == null && _priceException == null;
}
