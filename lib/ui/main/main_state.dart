part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class PurchasesThemeChanged extends MainState {
  final ThemeState themeState;

  PurchasesThemeChanged(this.themeState);

  @override
  List<Object> get props => [themeState];
}
