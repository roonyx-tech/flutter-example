import 'package:e_shop_flutter/data/local/dao/items_dao/items_dao.dart';
import 'package:e_shop_flutter/data/local/database.dart';
import 'package:e_shop_flutter/data/local/models/item_view.dart';
import 'package:e_shop_flutter/di/modules.dart';

class ItemsRepository {
  final ItemsDao _dao = getIt.get<LocalDatabase>().itemsDao;

  Future addItems(List<ItemData> itemsData) => _dao.insertValues(itemsData);

  Future<List<ItemView>> getItemsBypurchaseId(int purchaseId) => _dao
      .getItemsByPurchaseId(purchaseId)
      .then((values) => values.map((e) => ItemView.fromItemData(e)).toList());
}
