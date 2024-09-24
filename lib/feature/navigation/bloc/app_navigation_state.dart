part of 'app_navigation_bloc.dart';

@immutable
abstract class AppNavigationState extends Equatable {
  final AppPageEnum currentPage;

  const AppNavigationState({
    this.currentPage = AppPageEnum.accounts,
  });
}

abstract class AppNavigationActionState extends AppNavigationState {}

final class AppNavigationInitial extends AppNavigationState {
  @override
  List<Object> get props => [
        currentPage,
      ];

  const AppNavigationInitial({super.currentPage});
}

enum AppPageEnum {
  accounts(title: 'Accounts', route: '/accounts', pageIndex: 0),
  categories(title: 'Categories', route: '/categories', pageIndex: 1),
  transactions(title: 'Transactions', route: '/transactions', pageIndex: 2);

  // Fields associated with each enum value
  final String title;
  final String route;
  final int pageIndex;

  // Constructor
  const AppPageEnum(
      {required this.title, required this.route, required this.pageIndex});
}
