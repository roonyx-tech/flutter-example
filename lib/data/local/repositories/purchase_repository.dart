import 'package:e_shop_flutter/data/local/database.dart';
import 'package:e_shop_flutter/data/local/models/purchase_view.dart';
import 'package:e_shop_flutter/di/modules.dart';

class PurchaseRepository {
  final LocalDatabase _db = getIt.get<LocalDatabase>();

  Future<int> addPurchase(String name, double sum, {DateTime? date}) =>
      _db.purchaseDao.insert(PurchaseData(name: name, sum: sum, date: date));

  Future<List<PurchaseView>> getPurchases() => _db.purchaseDao
      .getPurchases()
      .then((value) => value.map((e) => e.mapToItemData()).toList());
}
