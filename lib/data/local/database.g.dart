// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PurchaseData extends DataClass implements Insertable<PurchaseData> {
  final int? id;
  final String name;
  final double sum;
  final DateTime? date;
  PurchaseData({this.id, required this.name, required this.sum, this.date});
  factory PurchaseData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PurchaseData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      sum: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sum'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['name'] = Variable<String>(name);
    map['sum'] = Variable<double>(sum);
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime?>(date);
    }
    return map;
  }

  PurchaseCompanion toCompanion(bool nullToAbsent) {
    return PurchaseCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      sum: Value(sum),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory PurchaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PurchaseData(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sum: serializer.fromJson<double>(json['sum']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'sum': serializer.toJson<double>(sum),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  PurchaseData copyWith({int? id, String? name, double? sum, DateTime? date}) =>
      PurchaseData(
        id: id ?? this.id,
        name: name ?? this.name,
        sum: sum ?? this.sum,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('PurchaseData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sum: $sum, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode, $mrjc(name.hashCode, $mrjc(sum.hashCode, date.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseData &&
          other.id == this.id &&
          other.name == this.name &&
          other.sum == this.sum &&
          other.date == this.date);
}

class PurchaseCompanion extends UpdateCompanion<PurchaseData> {
  final Value<int?> id;
  final Value<String> name;
  final Value<double> sum;
  final Value<DateTime?> date;
  const PurchaseCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sum = const Value.absent(),
    this.date = const Value.absent(),
  });
  PurchaseCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.sum = const Value.absent(),
    this.date = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PurchaseData> custom({
    Expression<int?>? id,
    Expression<String>? name,
    Expression<double>? sum,
    Expression<DateTime?>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sum != null) 'sum': sum,
      if (date != null) 'date': date,
    });
  }

  PurchaseCompanion copyWith(
      {Value<int?>? id,
      Value<String>? name,
      Value<double>? sum,
      Value<DateTime?>? date}) {
    return PurchaseCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sum: sum ?? this.sum,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sum.present) {
      map['sum'] = Variable<double>(sum.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime?>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sum: $sum, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $PurchaseTable extends Purchase
    with TableInfo<$PurchaseTable, PurchaseData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PurchaseTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _sumMeta = const VerificationMeta('sum');
  late final GeneratedColumn<double?> sum = GeneratedColumn<double?>(
      'sum', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, name, sum, date];
  @override
  String get aliasedName => _alias ?? 'purchase';
  @override
  String get actualTableName => 'purchase';
  @override
  VerificationContext validateIntegrity(Insertable<PurchaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum']!, _sumMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PurchaseData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PurchaseTable createAlias(String alias) {
    return $PurchaseTable(_db, alias);
  }
}

class ItemData extends DataClass implements Insertable<ItemData> {
  final int? id;
  final String name;
  final int count;
  final double price;
  final int purchaseId;
  ItemData(
      {this.id,
      required this.name,
      required this.count,
      required this.price,
      required this.purchaseId});
  factory ItemData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ItemData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      count: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}count'])!,
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      purchaseId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}purchase_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['name'] = Variable<String>(name);
    map['count'] = Variable<int>(count);
    map['price'] = Variable<double>(price);
    map['purchase_id'] = Variable<int>(purchaseId);
    return map;
  }

  ItemCompanion toCompanion(bool nullToAbsent) {
    return ItemCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      count: Value(count),
      price: Value(price),
      purchaseId: Value(purchaseId),
    );
  }

  factory ItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ItemData(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      count: serializer.fromJson<int>(json['count']),
      price: serializer.fromJson<double>(json['price']),
      purchaseId: serializer.fromJson<int>(json['purchaseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'count': serializer.toJson<int>(count),
      'price': serializer.toJson<double>(price),
      'purchaseId': serializer.toJson<int>(purchaseId),
    };
  }

  ItemData copyWith(
          {int? id,
          String? name,
          int? count,
          double? price,
          int? purchaseId}) =>
      ItemData(
        id: id ?? this.id,
        name: name ?? this.name,
        count: count ?? this.count,
        price: price ?? this.price,
        purchaseId: purchaseId ?? this.purchaseId,
      );
  @override
  String toString() {
    return (StringBuffer('ItemData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('count: $count, ')
          ..write('price: $price, ')
          ..write('purchaseId: $purchaseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(count.hashCode, $mrjc(price.hashCode, purchaseId.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemData &&
          other.id == this.id &&
          other.name == this.name &&
          other.count == this.count &&
          other.price == this.price &&
          other.purchaseId == this.purchaseId);
}

class ItemCompanion extends UpdateCompanion<ItemData> {
  final Value<int?> id;
  final Value<String> name;
  final Value<int> count;
  final Value<double> price;
  final Value<int> purchaseId;
  const ItemCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.count = const Value.absent(),
    this.price = const Value.absent(),
    this.purchaseId = const Value.absent(),
  });
  ItemCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.count = const Value.absent(),
    this.price = const Value.absent(),
    required int purchaseId,
  })  : name = Value(name),
        purchaseId = Value(purchaseId);
  static Insertable<ItemData> custom({
    Expression<int?>? id,
    Expression<String>? name,
    Expression<int>? count,
    Expression<double>? price,
    Expression<int>? purchaseId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (count != null) 'count': count,
      if (price != null) 'price': price,
      if (purchaseId != null) 'purchase_id': purchaseId,
    });
  }

  ItemCompanion copyWith(
      {Value<int?>? id,
      Value<String>? name,
      Value<int>? count,
      Value<double>? price,
      Value<int>? purchaseId}) {
    return ItemCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      price: price ?? this.price,
      purchaseId: purchaseId ?? this.purchaseId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (purchaseId.present) {
      map['purchase_id'] = Variable<int>(purchaseId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('count: $count, ')
          ..write('price: $price, ')
          ..write('purchaseId: $purchaseId')
          ..write(')'))
        .toString();
  }
}

class $ItemTable extends Item with TableInfo<$ItemTable, ItemData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ItemTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _countMeta = const VerificationMeta('count');
  late final GeneratedColumn<int?> count = GeneratedColumn<int?>(
      'count', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, false,
      typeName: 'REAL',
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  final VerificationMeta _purchaseIdMeta = const VerificationMeta('purchaseId');
  late final GeneratedColumn<int?> purchaseId = GeneratedColumn<int?>(
      'purchase_id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES purchase(id) ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [id, name, count, price, purchaseId];
  @override
  String get aliasedName => _alias ?? 'item';
  @override
  String get actualTableName => 'item';
  @override
  VerificationContext validateIntegrity(Insertable<ItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('purchase_id')) {
      context.handle(
          _purchaseIdMeta,
          purchaseId.isAcceptableOrUnknown(
              data['purchase_id']!, _purchaseIdMeta));
    } else if (isInserting) {
      context.missing(_purchaseIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ItemData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ItemTable createAlias(String alias) {
    return $ItemTable(_db, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PurchaseTable purchase = $PurchaseTable(this);
  late final $ItemTable item = $ItemTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [purchase, item];
}
