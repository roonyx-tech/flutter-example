import 'package:e_shop_flutter/data/local/dao/purchase_dao/purchase_dao.dart';
import 'package:e_shop_flutter/data/local/database.dart';
import 'package:e_shop_flutter/di/modules.dart';

class PurchaseRepository {
  final PurchaseDao _db = getIt.get<LocalDatabase>().purchaseDao;

  Future<int> addPurchase(PurchaseData data) => _db.insert(data);

  Future<List<PurchaseData>> getPurchases() => _db.getPurchases();

  Future deletePurchase(PurchaseData purchaseData) =>
      _db.deletePurchase(purchaseData);
}
