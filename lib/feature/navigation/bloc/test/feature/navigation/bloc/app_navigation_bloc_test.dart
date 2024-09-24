import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:panorama/feature/navigation/bloc/app_navigation_bloc.dart';

void main() {
  group('AppNavigationBloc', () {
    late AppNavigationBloc appNavigationBloc;

    // Initialize the bloc before each test
    setUp(() {
      appNavigationBloc = AppNavigationBloc();
    });

    // Dispose the bloc after each test
    tearDown(() {
      appNavigationBloc.close();
    });

    test('initial state is AppNavigationInitial', () {
      expect(appNavigationBloc.state, const AppNavigationInitial());
    });

    blocTest<AppNavigationBloc, AppNavigationState>(
      'emits [AppNavigationInitial(currentPage: AppPageEnum.accounts)] when AppNavigationAccountsPageEvent is added',
      build: () => appNavigationBloc,
      act: (bloc) => bloc.add(AppNavigationAccountsPageEvent()),
      expect: () => [
        const AppNavigationInitial(currentPage: AppPageEnum.accounts),
      ],
    );

    blocTest<AppNavigationBloc, AppNavigationState>(
      'emits [AppNavigationInitial(currentPage: AppPageEnum.categories)] when AppNavigationCategoriesPageEvent is added',
      build: () => appNavigationBloc,
      act: (bloc) => bloc.add(AppNavigationCategoriesPageEvent()),
      expect: () => [
        const AppNavigationInitial(currentPage: AppPageEnum.categories),
      ],
    );

    blocTest<AppNavigationBloc, AppNavigationState>(
      'emits [AppNavigationInitial(currentPage: AppPageEnum.transactions)] when AppNavigationTransactionsPageEvent is added',
      build: () => appNavigationBloc,
      act: (bloc) => bloc.add(AppNavigationTransactionsPageEvent()),
      expect: () => [
        const AppNavigationInitial(currentPage: AppPageEnum.transactions),
      ],
    );
  });
}
