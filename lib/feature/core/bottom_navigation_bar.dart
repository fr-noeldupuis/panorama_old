import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:panorama/feature/navigation/bloc/app_navigation_bloc.dart';

class PanoramaBottomNavBar extends StatelessWidget {
  const PanoramaBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.currentPage.pageIndex,
          onTap: (value) {
            switch (value) {
              case 0:
                context
                    .read<AppNavigationBloc>()
                    .add(AppNavigationAccountsPageEvent());
                break;
              case 1:
                context
                    .read<AppNavigationBloc>()
                    .add(AppNavigationCategoriesPageEvent());
                break;
              case 2:
                context
                    .read<AppNavigationBloc>()
                    .add(AppNavigationTransactionsPageEvent());
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.building_columns_solid),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.chart_pie_solid),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.list_solid),
              label: 'Transactions',
            ),
          ],
        );
      },
    );
  }
}
