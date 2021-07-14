import 'package:e_shop_flutter/data/local/database.dart';
import 'package:e_shop_flutter/di/modules.dart';

class PurchaseRepository {
  final MyDatabase _db = getIt.get<MyDatabase>();

  Future<void> addPurchase(String name, double sum, {DateTime? date}) =>
      _db.purchaseDao.insert(PurchaseData(name: name, sum: sum, date: date));

  Future<List<PurchaseData>> getPurchases() => _db.purchaseDao.getPurchases();
}
