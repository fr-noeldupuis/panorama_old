import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_navigation_event.dart';
part 'app_navigation_state.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  AppNavigationBloc() : super(const AppNavigationInitial()) {
    on<AppNavigationAccountsPageEvent>((event, emit) {
      emit(AppNavigationInitial(currentPage: AppPageEnum.accounts));
    });
    on<AppNavigationCategoriesPageEvent>((event, emit) {
      emit(AppNavigationInitial(currentPage: AppPageEnum.categories));
    });
    on<AppNavigationTransactionsPageEvent>((event, emit) {
      emit(AppNavigationInitial(currentPage: AppPageEnum.transactions));
    });
  }
}
