import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_page_event.dart';
part 'account_page_state.dart';

class AccountPageBloc extends Bloc<AccountPageEvent, AccountPageState> {
  AccountPageBloc() : super(AccountPageInitial()) {
    on<AccountPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
