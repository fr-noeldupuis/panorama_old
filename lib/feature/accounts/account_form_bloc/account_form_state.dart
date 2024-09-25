part of 'account_form_bloc.dart';

abstract class AccountFormState extends Equatable {
  final String accountName;
  final AccountType accountType;
  final double? initialBalance;
  final int colorValue;
  AccountFormState({
    required this.accountName,
    required this.accountType,
    this.initialBalance,
    colorValue,
  }) : colorValue = colorValue ?? availableColors[Colors.red]![5].value;

  @override
  List<Object?> get props => [
        accountName,
        accountType,
        initialBalance,
        colorValue,
      ];
}

class AccountFormInitial extends AccountFormState {
  AccountFormInitial({
    required super.accountName,
    required super.accountType,
    super.initialBalance,
    super.colorValue,
  });
}

class AccountFormValid extends AccountFormState {
  AccountFormValid({
    required super.accountName,
    required super.accountType,
    super.initialBalance,
    super.colorValue,
  });
}

class AccountFormInvalid extends AccountFormState {
  final String error;

  AccountFormInvalid({
    required super.accountName,
    required super.accountType,
    super.initialBalance,
    super.colorValue,
    required this.error,
  });

  @override
  List<Object?> get props =>
      [accountName, accountType, initialBalance, colorValue, error];
}
