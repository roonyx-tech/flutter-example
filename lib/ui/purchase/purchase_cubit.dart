import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/data/local/models/item_view.dart';
import 'package:e_shop_flutter/data/local/repositories/items_repository.dart';
import 'package:e_shop_flutter/di/modules.dart';
import 'package:equatable/equatable.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  PurchaseCubit() : super(PurchaseInitial());

  final ItemsRepository _repository = getIt.get<ItemsRepository>();

  List<ItemView> _items = [];
  List<ItemView> get items => _items;

  void loadItems(int purchaseId) async {
    _items = await _repository.getItemsBypurchaseId(purchaseId);
    emit(PurchaseItemsFetched(_items));
  }
}
