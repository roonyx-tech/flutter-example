import 'package:bloc/bloc.dart';
import '../../data/local/database.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/list_extensions.dart';
import '../../utils/string_extensions.dart';

part 'addpurchase_state.dart';

const int YEAR = 365;

class AddPurchaseCubit extends Cubit<AddPurchaseState> {
  AddPurchaseCubit() : super(AddpurchaseInitial());

  // Data
  TextEditingController _purchaseNameController = TextEditingController();
  TextEditingController get purchaseNameController => _purchaseNameController;

  TextEditingController _itemNameController = TextEditingController();
  TextEditingController get itemNameController => _itemNameController;

  TextEditingController _itemPriceController = TextEditingController();
  TextEditingController get itemPriceController => _itemPriceController;

  List<ItemData> _items = [];
  List<ItemData> get items => _items;
  String get sum => '${_items.map((e) => e.price * e.count).toList().sum()}'
      .getDecimalValue();

  DateTime _date = DateTime.now();
  String get date => DateFormat('dd MMMM yyyy').format(_date);

  void _clearItemsControllers() {
    _itemNameController = TextEditingController();
    _itemPriceController = TextEditingController();
  }

  void addItem() {
    _items = _items.addWithCopy(ItemData(
        name: _itemNameController.text,
        count: 1,
        price:
            double.tryParse(_itemPriceController.text.replaceAll(',', '.')) ??
                0,
        purchaseId: -1));
    _clearItemsControllers();
    emit(ItemsChanged(_items));
  }

  void pickDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now().subtract(new Duration(days: YEAR)),
      lastDate: DateTime.now().add(new Duration(days: YEAR)),
    ).then((value) {
      if (value != null) {
        _date = value;
        emit(DateChanged(_date));
      }
    });
  }
}
