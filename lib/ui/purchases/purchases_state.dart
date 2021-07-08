part of 'purchases_cubit.dart';

abstract class PurchasesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PurchasesInitial extends PurchasesState {}

class PurchasesThemeChanged extends PurchasesState {
  final ThemeState themeState;

  PurchasesThemeChanged(this.themeState);

  @override
  List<Object?> get props => [themeState];
}
