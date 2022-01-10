import 'package:e_shop_flutter/core/data/local/models/item_view.dart';
import 'package:e_shop_flutter/core/data/local/models/purchase_view.dart';
import 'package:e_shop_flutter/core/data/local/repositories/items_repository.dart';
import 'package:e_shop_flutter/core/data/local/repositories/purchase_repository.dart';
import 'package:e_shop_flutter/core/utils/list_extensions.dart';

import '../database.dart';

class PurchaseInteractor {
  final PurchaseRepository _purchaseRepository;
  final ItemsRepository _itemsRepository;

  PurchaseInteractor({
    required PurchaseRepository purchaseRepository,
    required ItemsRepository itemsRepository,
  })  : _purchaseRepository = purchaseRepository,
        _itemsRepository = itemsRepository;

  Future addNewPurchase(
      {required String purchaseName,
      required DateTime date,
      required List<ItemView> items}) async {
    final int purchaseId = await _purchaseRepository.addPurchase(PurchaseData(
        name: purchaseName,
        sum: items.map((e) => e.price * e.count).toList().sum(),
        date: date));

    final List<ItemData> itemsData =
        items.map((e) => e.mapToItemData(purchaseId)).toList();

    await _itemsRepository.addItems(itemsData);
  }

  Future deletePurchase(PurchaseView purchase) =>
      _purchaseRepository.deletePurchase(purchase.mapToPurchaseData());

  Future getPurchases() => _purchaseRepository
      .getPurchases()
      .then((value) => value.map((e) => e.mapToPurchaseView()).toList());
}
