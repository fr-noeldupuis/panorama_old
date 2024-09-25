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
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                child: Icon(FontAwesome.credit_card_solid),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 7.0, 0, 7.0),
                child: Icon(FontAwesome.credit_card_solid, size: 26),
              ),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                child: Icon(TeenyIcons.donut_chart),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 7.0, 0, 7.0),
                child: Icon(TeenyIcons.donut_chart, size: 26),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                child: Icon(FontAwesome.list_solid),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.fromLTRB(0, 7.0, 0, 7.0),
                child: Icon(FontAwesome.list_solid, size: 26),
              ),
              label: 'Transactions',
            ),
          ],
        );
      },
    );
  }
}
