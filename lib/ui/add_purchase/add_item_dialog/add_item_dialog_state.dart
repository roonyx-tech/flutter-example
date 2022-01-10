part of 'add_item_dialog_cubit.dart';

abstract class AddItemDialogState extends Equatable {
  const AddItemDialogState();

  @override
  List<Object?> get props => [];
}

class AddItemdialogInitial extends AddItemDialogState {}

class NameErrorException extends AddItemDialogState {
  final ValueException? exception;

  const NameErrorException(this.exception);

  @override
  List<Object?> get props => [exception];
}

class PriceErrorException extends AddItemDialogState {
  final ValueException? exception;

  const PriceErrorException(this.exception);

  @override
  List<Object?> get props => [exception];
}
