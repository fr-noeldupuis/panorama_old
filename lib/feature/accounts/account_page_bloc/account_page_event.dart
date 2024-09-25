part of 'account_page_bloc.dart';

sealed class AccountPageEvent extends Equatable {
  const AccountPageEvent();

  @override
  List<Object> get props => [];
}

class LoadAccounts extends AccountPageEvent {}

class AddAccount extends AccountPageEvent {
  final Account account;

  const AddAccount(this.account);
}

class UpdateAccount extends AccountPageEvent {
  final Account account;

  const UpdateAccount(this.account);
}

class DeleteAccount extends AccountPageEvent {
  final String id;

  const DeleteAccount(this.id);
}
