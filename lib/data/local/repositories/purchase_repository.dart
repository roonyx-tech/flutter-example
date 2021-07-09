import 'package:e_shop_flutter/data/local/database.dart';

class PurchaseRepository {
  static final PurchaseRepository _instance = PurchaseRepository._internal();

  factory PurchaseRepository.getInstance() {
    return _instance;
  }

  PurchaseRepository._internal() : super();

  MyDatabase _db = MyDatabase.getInstance();

  Future<void> addPurchase(String name, double sum, {DateTime? date}) =>
      _db.purchaseDao.insert(PurchaseData(name: name, sum: sum, date: date));

  Future<List<PurchaseData>> getPurchases() => _db.purchaseDao.getPurchases();
}
