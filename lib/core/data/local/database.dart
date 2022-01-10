import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'dao/items_dao/items_dao.dart';
import 'dao/purchase_dao/purchase_dao.dart';
import 'models/item.dart';
import 'models/purchase.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Purchase, Item])
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
