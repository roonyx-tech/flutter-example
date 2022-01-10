import 'package:bloc/bloc.dart';
import 'package:e_shop_flutter/core/data/local/models/item_view.dart';
import 'package:e_shop_flutter/core/data/local/repositories/items_repository.dart';
import 'package:equatable/equatable.dart';

part 'purchase_state.dart';

class PurchaseCubit extends Cubit<PurchaseState> {
  final ItemsRepository _itemsRepository;

  PurchaseCubit(ItemsRepository itemsRepository)
      : _itemsRepository = itemsRepository,
        super(PurchaseInitial());

  List<ItemView> _items = [];
  List<ItemView> get items => _items;

  void loadItems(int purchaseId) =>
      _itemsRepository.getItemsBypurchaseId(purchaseId).then(
        (itmes) {
          _items = items;
          emit(PurchaseItemsFetched(_items));
        },
      );
}
