part of 'purchase_cubit.dart';

abstract class PurchaseState extends Equatable {
  const PurchaseState();

  @override
  List<Object> get props => [];
}

class PurchaseInitial extends PurchaseState {}

class PurchaseItemsFetched extends PurchaseState {
  final List<ItemView> items;

  const PurchaseItemsFetched(this.items);

  @override
  List<Object> get props => [items];
}
