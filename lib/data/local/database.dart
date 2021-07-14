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
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  PurchaseDao get purchaseDao => PurchaseDao(this);

  @override
  int get schemaVersion => 1;
}
