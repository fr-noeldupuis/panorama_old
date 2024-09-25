import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:panorama/feature/accounts/model/account.dart';
import 'package:panorama/utils/const.dart';

part 'account_form_event.dart';
part 'account_form_state.dart';

class AccountFormBloc extends Bloc<AccountFormEvent, AccountFormState> {
  AccountFormBloc({AccountType? accountType})
      : super(AccountFormInitial(
          accountName: '',
          accountType: accountType ?? AccountType.cash,
          initialBalance: null,
        )) {
    on<AccountNameChanged>((event, emit) {
      if (event.accountName.isEmpty) {
        emit(AccountFormInvalid(
            accountName: event.accountName,
            error: "Account name cannot be empty.",
            accountType: state.accountType,
            initialBalance: state.initialBalance));
      } else {
        if (_validateForm(accountName: event.accountName)) {
          emit(AccountFormValid(
              accountName: event.accountName,
              accountType: state.accountType,
              initialBalance: state.initialBalance));
        } else {
          emit(AccountFormInitial(
              accountName: event.accountName,
              accountType: state.accountType,
              initialBalance: state.initialBalance));
        }
      }
    });
    on<AccountTypeChanged>(
      (event, emit) {
        if (_validateForm(accountType: event.accountType)) {
          emit(AccountFormValid(
              accountName: state.accountName,
              accountType: event.accountType,
              initialBalance: state.initialBalance));
        } else {
          emit(AccountFormInitial(
              accountName: state.accountName,
              accountType: event.accountType,
              initialBalance: state.initialBalance));
        }
      },
    );
    on<InitialBalanceChanged>(
      (event, emit) {
        print(event.initialBalance);
        if (event.initialBalance != null) {
          if (_validateForm(initialBalance: event.initialBalance)) {
            emit(AccountFormValid(
                accountName: state.accountName,
                accountType: state.accountType,
                initialBalance: event.initialBalance));
          } else {
            emit(AccountFormInitial(
                accountName: state.accountName,
                accountType: state.accountType,
                initialBalance: event.initialBalance));
          }
        }
      },
    );
    on<ColorChanged>(
      (event, emit) {
        if (_validateForm(colorValue: event.colorValue)) {
          emit(AccountFormValid(
            accountName: state.accountName,
            accountType: state.accountType,
            initialBalance: state.initialBalance,
            colorValue: event.colorValue,
          ));
        } else {
          emit(AccountFormInitial(
            accountName: state.accountName,
            accountType: state.accountType,
            initialBalance: state.initialBalance,
            colorValue: event.colorValue,
          ));
        }
      },
    );
    on<AccountFormSubmitted>(
      (event, emit) {
        if (state is AccountFormValid) {
        } else {
          emit(AccountFormInvalid(
              accountName: state.accountName,
              error: "Invalid form.",
              accountType: state.accountType,
              initialBalance: state.initialBalance));
        }
      },
    );
  }

  bool _validateForm({
    String? accountName,
    AccountType? accountType,
    double? initialBalance,
    int? colorValue,
  }) {
    return (accountName ?? state.accountName).isNotEmpty &&
        (initialBalance ?? state.initialBalance) != null;
  }
}
