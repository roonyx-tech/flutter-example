import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../utils/string_extensions.dart';

class ItemView extends Equatable {
  int id;
  String name;
  int count;
  double price;
  ItemView({
    required this.id,
    required this.name,
    required this.count,
    required this.price,
  });

  ItemView copyWith({
    int? id,
    String? name,
    int? count,
    double? price,
  }) {
    return ItemView(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'count': count,
      'price': price,
    };
  }

  factory ItemView.fromMap(Map<String, dynamic> map) {
    return ItemView(
      id: map['id'],
      name: map['name'],
      count: map['count'],
      price: map['price'],
    );
  }

  String get normalPrice => "$price".getDecimalValue();

  String toJson() => json.encode(toMap());

  factory ItemView.fromJson(String source) =>
      ItemView.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemView(id: $id, name: $name, count: $count, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemView &&
        other.id == id &&
        other.name == name &&
        other.count == count &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ count.hashCode ^ price.hashCode;
  }

  @override
  List<Object?> get props => [id, name, count, price];
}
