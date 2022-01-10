import 'package:e_shop_flutter/core/data/local/dao/items_dao/items_dao.dart';
import 'package:e_shop_flutter/core/data/local/models/item_view.dart';
import '../database.dart';

class ItemsRepository {

  final ItemsDao _dao;

  const ItemsRepository(ItemsDao dao) : _dao = dao;

  Future addItems(List<ItemData> itemsData) => _dao.insertValues(itemsData);

  Future<List<ItemView>> getItemsBypurchaseId(int purchaseId) => _dao
      .getItemsByPurchaseId(purchaseId)
      .then((values) => values.map((e) => ItemView.fromItemData(e)).toList());
}
