part of 'purchases_cubit.dart';

abstract class PurchasesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PurchasesInitial extends PurchasesState {}

class PurchasesList extends PurchasesState {
  final List<PurchaseData> list;

  PurchasesList(this.list);

  @override
  List<Object?> get props => [list];
}
