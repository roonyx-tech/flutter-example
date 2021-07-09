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
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Purchase, Item])
class MyDatabase extends _$MyDatabase {

  static final MyDatabase _instance = MyDatabase._internal(_openConnection());

  factory MyDatabase.getInstance() {
    return _instance;
  }

  MyDatabase._internal(QueryExecutor executor) : super(executor);

  PurchaseDao get purchaseDao => PurchaseDao(this);

  @override
  int get schemaVersion => 1;
}
