part of 'addpurchase_cubit.dart';

abstract class AddPurchaseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddpurchaseInitial extends AddPurchaseState {}

class DateChanged extends AddPurchaseState {
  final DateTime date;

  DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class ItemsChanged extends AddPurchaseState {
  final List<ItemView> items;

  ItemsChanged(this.items);

  @override
  List<Object> get props => [items];
}

class ItemChanged extends AddPurchaseState {
  final int id;
  final int count;

  ItemChanged(this.id, this.count);

  @override
  List<Object> get props => [id, count];
}

class PurchaseNameException extends AddPurchaseState {
  final ValueException? exception;

  PurchaseNameException(this.exception);

  @override
  List<Object?> get props => [exception];
}
