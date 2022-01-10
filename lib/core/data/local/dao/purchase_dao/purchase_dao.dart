import 'package:drift/drift.dart';

import '../../database.dart';
import '../../models/purchase.dart';

part 'purchase_dao.g.dart';

@DriftAccessor(tables: [Purchase])
class PurchaseDao extends DatabaseAccessor<LocalDatabase>
    with _$PurchaseDaoMixin {
  PurchaseDao(LocalDatabase db) : super(db);

  Future deletePurchase(PurchaseData data) => delete(purchase).delete(data);

  Future<List<PurchaseData>> getPurchases() => (select(purchase)
        ..orderBy([
          (u) => OrderingTerm(
              expression: u.date.secondsSinceEpoch, mode: OrderingMode.desc),
          (u) => OrderingTerm(expression: u.sum, mode: OrderingMode.desc)
        ]))
      .get();

  Future<int> insert(PurchaseData value) => into(purchase).insert(value);
}
