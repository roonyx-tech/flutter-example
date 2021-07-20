import 'package:e_shop_flutter/data/local/dao/items_dao/items_dao.dart';
import 'package:e_shop_flutter/data/local/dao/purchase_dao/purchase_dao.dart';
import 'package:e_shop_flutter/data/local/models/purchase.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

import 'models/item.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Purchase, Item])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  PurchaseDao get purchaseDao => PurchaseDao(this);
  ItemsDao get itemsDao => ItemsDao(this);

  @override
  int get schemaVersion => 1;

  @override
  StreamQueryUpdateRules get streamUpdateRules => StreamQueryUpdateRules([
        WritePropagation(
            on: TableUpdateQuery.onTable(purchase,
                limitUpdateKind: UpdateKind.delete),
            result: [TableUpdate.onTable(item, kind: UpdateKind.delete)])
      ]);
}
