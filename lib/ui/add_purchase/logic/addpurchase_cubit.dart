import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/core/base/exceptions.dart';
import 'package:e_shop_flutter/core/data/local/interactors/purchase_interactor.dart';
import 'package:e_shop_flutter/core/data/local/models/item_view.dart';
import 'package:e_shop_flutter/core/utils/list_extensions.dart';
import 'package:e_shop_flutter/core/utils/string_extensions.dart';
import 'package:e_shop_flutter/ui/main/logic/main_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'addpurchase_state.dart';

const int year = 365;

class AddPurchaseCubit extends Cubit<AddPurchaseState> {
  final PurchaseInteractor _purchaseInteractor;
  final MainCubit _mainCubit;

  AddPurchaseCubit({
    required PurchaseInteractor purchaseInteractor,
    required MainCubit mainCubit,
  })  : _purchaseInteractor = purchaseInteractor,
        _mainCubit = mainCubit,
        super(AddpurchaseInitial());

  // Data
  final TextEditingController purchaseNameController = TextEditingController();
  String get purchaseNameText => purchaseNameController.text;

  ValueException? _purchaseNameException;
  ValueException? get purchaseNameException => _purchaseNameException;

  TextEditingController itemNameController = TextEditingController();
  String get itemNameText => itemNameController.text;

  TextEditingController itemPriceController = TextEditingController();
  String get itemPriceText => itemPriceController.text;

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

  Color get themeIcColor => _mainCubit.themeIcColor;

  void validatePurchaseName() {
    _purchaseNameException = purchaseNameText.isEmpty
        ? ValueException(ValueExceptionType.empty)
        : null;

    emit(PurchaseNameException(_purchaseNameException));
  }

  void _clearItemsControllers() {
    itemNameController = TextEditingController();
    itemPriceController = TextEditingController();
  }

  void addItem() {
    _items.add(ItemView(
      id: _items.length,
      name: itemNameController.text,
      count: 1,
      price:
          double.tryParse(itemPriceController.text.replaceAll(',', '.')) ?? 0,
    ));
    _clearItemsControllers();
    emit(ItemsChanged(_items, _items.length));
  }

  void pickDate(BuildContext context) => showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now().subtract(const Duration(days: year)),
        lastDate: DateTime.now().add(const Duration(days: year)),
      ).then((value) {
        if (value != null) {
          _date = value;
          emit(DateChanged(_date));
        }
      });

  void updateItemCounts(ItemView item) =>
      emit(ItemChanged(item.id, item.count));

  void deleteItem(ItemView item) {
    _items.remove(item);
    emit(ItemChanged(item.id, item.count));
  }

  void dispose() {
    purchaseNameController.dispose();
    itemNameController.dispose();
    itemPriceController.dispose();
  }

  void save() {
    _purchaseInteractor
        .addNewPurchase(
          purchaseName: purchaseNameText,
          date: _date,
          items: _items,
        )
        .then(
          (value) => emit(PurchaseSaved()),
        );
  }
}
