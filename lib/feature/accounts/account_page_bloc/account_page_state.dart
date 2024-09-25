part of 'account_page_bloc.dart';

sealed class AccountPageState extends Equatable {
  const AccountPageState();

  @override
  List<Object> get props => [];
}

abstract class AccountPageActionState extends AccountPageState {}

class AccountPageInitial extends AccountPageState {}

class AccountPageLoading extends AccountPageState {}

class AccountPageLoaded extends AccountPageState {
  final List<Account> accounts;

  const AccountPageLoaded(this.accounts);
}

class AccountPageError extends AccountPageState {}
