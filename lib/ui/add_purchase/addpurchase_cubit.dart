import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/base/exceptions.dart';
import 'package:e_shop_flutter/data/local/interactors/purchase_interactor.dart';
import 'package:e_shop_flutter/data/local/models/item_view.dart';
import 'package:e_shop_flutter/di/modules.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/list_extensions.dart';
import '../../utils/string_extensions.dart';

part 'addpurchase_state.dart';

const int year = 365;

class AddPurchaseCubit extends Cubit<AddPurchaseState> {
  AddPurchaseCubit() : super(AddpurchaseInitial());

  final PurchaseInteractor _interactor = getIt.get<PurchaseInteractor>();

  // Data
  final TextEditingController _purchaseNameController = TextEditingController();
  TextEditingController get purchaseNameController => _purchaseNameController;
  String get purchaseNameText => _purchaseNameController.text;

  ValueException? _purchaseNameException;
  ValueException? get purchaseNameException => _purchaseNameException;

  TextEditingController _itemNameController = TextEditingController();
  TextEditingController get itemNameController => _itemNameController;
  String get itemNameText => _itemNameController.text;

  TextEditingController _itemPriceController = TextEditingController();
  TextEditingController get itemPriceController => _itemPriceController;
  String get itemPriceText => _itemPriceController.text;

  final List<ItemView> _items = [];
  List<ItemView> get items => _items;
  String get sum => _items
      .map((e) => e.price * e.count)
      .toList()
      .sum()
      .toStringAsFixed(2)
      .getDecimalValue();

  DateTime _date = DateTime.now();
  String get date => DateFormat('dd MMMM yyyy').format(_date);

  bool get canSave =>
      purchaseNameText.isNotEmpty &&
      _purchaseNameException == null &&
      _items.isNotEmpty;

  validatePurchaseName() {
    _purchaseNameException = purchaseNameText.isEmpty
        ? ValueException(ValueExceptionType.empty)
        : null;

    emit(PurchaseNameException(_purchaseNameException));
  }

  _clearItemsControllers() {
    _itemNameController = TextEditingController();
    _itemPriceController = TextEditingController();
  }

  addItem() {
    _items.add(ItemView(
      id: _items.length,
      name: _itemNameController.text,
      count: 1,
      price:
          double.tryParse(_itemPriceController.text.replaceAll(',', '.')) ?? 0,
    ));
    _clearItemsControllers();
    emit(ItemsChanged(_items, _items.length));
  }

  pickDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now().subtract(Duration(days: year)),
      lastDate: DateTime.now().add(Duration(days: year)),
    ).then((value) {
      if (value != null) {
        _date = value;
        emit(DateChanged(_date));
      }
    });
  }

  updateItemCounts(ItemView item) {
    emit(ItemChanged(item.id, item.count));
  }

  deleteItem(ItemView item) {
    _items.remove(item);
    emit(ItemChanged(item.id, item.count));
  }

  dispose() {
    _purchaseNameController.dispose();
    _itemNameController.dispose();
    _itemPriceController.dispose();
  }

  save() async {
    await _interactor.addNewPurchase(
        purchaseName: purchaseNameText, date: _date, items: _items);
    emit(PurchaseSaved());
  }
}
