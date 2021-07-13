part of 'addpurchase_cubit.dart';

abstract class AddPurchaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddpurchaseInitial extends AddPurchaseState {}

class DateChanged extends AddPurchaseState {
  final DateTime date;

  DateChanged(this.date);

  @override
  List<Object> get props => [date];
}

class ItemsChanged extends AddPurchaseState {
  final List<ItemData> items;

  ItemsChanged(this.items);

  @override
  List<Object> get props => [items];
}
