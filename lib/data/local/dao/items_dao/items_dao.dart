import 'package:e_shop_flutter/data/local/models/item.dart';
import 'package:moor/moor.dart';

import '../../database.dart';

part 'items_dao.g.dart';

@UseDao(tables: [Item])
class ItemsDao extends DatabaseAccessor<LocalDatabase> with _$ItemsDaoMixin {
  ItemsDao(LocalDatabase db) : super(db);

  Future<int> insert(ItemData value) async => await into(item).insert(value);

  Future insertValues(List<ItemData> values) async =>
      await batch((batch) => batch.insertAll(item, values));

  Future<List<ItemData>> getItemsByPurchaseId(int purchaseId) =>
      (select(item)..where((tbl) => tbl.purchaseId.equals(purchaseId))).get();
}
