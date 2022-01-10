import 'package:e_shop_flutter/core/data/local/dao/purchase_dao/purchase_dao.dart';

import '../database.dart';

class PurchaseRepository {
  final PurchaseDao _purchaseDao;

  PurchaseRepository(PurchaseDao purchaseDao) : _purchaseDao = purchaseDao;

  Future<int> addPurchase(PurchaseData data) => _purchaseDao.insert(data);

  Future<List<PurchaseData>> getPurchases() => _purchaseDao.getPurchases();

  Future deletePurchase(PurchaseData purchaseData) =>
      _purchaseDao.deletePurchase(purchaseData);
}
