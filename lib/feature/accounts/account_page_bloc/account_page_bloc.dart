import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:panorama/feature/accounts/model/account.dart';
import 'package:panorama/feature/accounts/repositories/account_repository.dart';

part 'account_page_event.dart';
part 'account_page_state.dart';

class AccountPageBloc extends Bloc<AccountPageEvent, AccountPageState> {
  final AccountRepository accountRepository;

  AccountPageBloc({required this.accountRepository})
      : super(AccountPageInitial()) {
    on<LoadAccounts>((event, emit) async {
      emit(AccountPageLoading());
      try {
        final accounts = await accountRepository.getAllAccounts();
        emit(AccountPageLoaded(accounts));
      } catch (e) {
        emit(AccountPageError());
      }
    });

    on<AddAccount>((event, emit) async {
      try {
        await accountRepository.addAccount(event.account);
        add(LoadAccounts()); // Reload accounts after adding
      } catch (e) {
        emit(AccountPageError());
      }
    });

    on<UpdateAccount>((event, emit) async {
      try {
        await accountRepository.updateAccount(event.account);
        add(LoadAccounts()); // Reload accounts after updating
      } catch (e) {
        emit(AccountPageError());
      }
    });

    on<DeleteAccount>((event, emit) async {
      try {
        await accountRepository.deleteAccount(event.id);
        add(LoadAccounts()); // Reload accounts after deleting
      } catch (e) {
        emit(AccountPageError());
      }
    });
  }
}
