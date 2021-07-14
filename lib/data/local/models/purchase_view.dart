import 'dart:convert';
import 'package:e_shop_flutter/data/local/database.dart';
import 'package:e_shop_flutter/utils/string_extensions.dart';
import 'package:intl/intl.dart';

extension PurchaseDataExtensions on PurchaseData {
  PurchaseView mapToItemData() => PurchaseView(
      id: id ?? -1, name: name, sum: sum, date: date ?? DateTime.now());
}

class PurchaseView {
  int id;
  String name;
  double sum;
  DateTime date;

  String get normalSum => '$sum'.getDecimalValue();
  String get stringDate => DateFormat('dd MMMM yyyy').format(date);

  PurchaseView({
    required this.id,
    required this.name,
    required this.sum,
    required this.date,
  });

  PurchaseView copyWith({
    int? id,
    String? name,
    double? sum,
    DateTime? date,
  }) {
    return PurchaseView(
      id: id ?? this.id,
      name: name ?? this.name,
      sum: sum ?? this.sum,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sum': sum,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory PurchaseView.fromMap(Map<String, dynamic> map) {
    return PurchaseView(
      id: map['id'],
      name: map['name'],
      sum: map['sum'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseView.fromJson(String source) =>
      PurchaseView.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PurchaseView(id: $id, name: $name, sum: $sum, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PurchaseView &&
        other.id == id &&
        other.name == name &&
        other.sum == sum &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ sum.hashCode ^ date.hashCode;
  }
}
