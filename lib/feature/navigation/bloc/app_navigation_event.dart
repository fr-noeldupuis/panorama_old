part of 'app_navigation_bloc.dart';

@immutable
sealed class AppNavigationEvent {}

class AppNavigationAccountsPageEvent extends AppNavigationEvent {}

class AppNavigationCategoriesPageEvent extends AppNavigationEvent {}

class AppNavigationTransactionsPageEvent extends AppNavigationEvent {}
