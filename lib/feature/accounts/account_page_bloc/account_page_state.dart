part of 'account_page_bloc.dart';

sealed class AccountPageState extends Equatable {
  const AccountPageState();

  @override
  List<Object> get props => [];
}

abstract class AccountPageActionState extends AccountPageState {}

final class AccountPageInitial extends AccountPageState {}
