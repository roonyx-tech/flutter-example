import 'package:e_shop_flutter/data/local/models/item_view.dart';
import 'package:e_shop_flutter/data/local/repositories/items_repository.dart';
import 'package:e_shop_flutter/data/local/repositories/purchase_repository.dart';
import 'package:e_shop_flutter/di/modules.dart';
import 'package:e_shop_flutter/utils/list_extensions.dart';

import '../database.dart';

class AddPurchaseInteractor {
  final PurchaseRepository _purchaseRepository =
      getIt.get<PurchaseRepository>();
  final ItemsRepository _itemsRepository = getIt.get<ItemsRepository>();

  Future addNewPurchase(
      {required String purchaseName,
      required DateTime date,
      required List<ItemView> items}) async {
    int purchaseId = await _purchaseRepository.addPurchase(
        purchaseName, items.map((e) => e.price * e.count).toList().sum());

    List<ItemData> itemsData =
        items.map((e) => e.mapToItemData(e, purchaseId)).toList();

    await _itemsRepository.addItems(itemsData);
  }
}
