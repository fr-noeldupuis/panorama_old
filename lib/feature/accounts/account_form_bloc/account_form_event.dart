part of 'account_form_bloc.dart';

abstract class AccountFormEvent extends Equatable {
  const AccountFormEvent();

  @override
  List<Object?> get props => [];
}

class AccountNameChanged extends AccountFormEvent {
  final String accountName;
  const AccountNameChanged(this.accountName);

  @override
  List<Object?> get props => [accountName];
}

class AccountTypeChanged extends AccountFormEvent {
  final AccountType accountType;
  const AccountTypeChanged(this.accountType);

  @override
  List<Object?> get props => [accountType];
}

class InitialBalanceChanged extends AccountFormEvent {
  final double initialBalance;
  const InitialBalanceChanged(this.initialBalance);

  @override
  List<Object?> get props => [initialBalance];
}

class ColorChanged extends AccountFormEvent {
  final int colorValue;
  const ColorChanged(this.colorValue);

  @override
  List<Object?> get props => [colorValue];
}

class AccountFormSubmitted extends AccountFormEvent {}
