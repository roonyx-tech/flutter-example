import 'package:e_shop_flutter/data/local/database.dart';
import 'package:e_shop_flutter/di/modules.dart';

class ItemsRepository {
  final LocalDatabase _db = getIt.get<LocalDatabase>();

  Future addItems(List<ItemData> itemsData) =>
      _db.itemsDao.insertValues(itemsData);
}
