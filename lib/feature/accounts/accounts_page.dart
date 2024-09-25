import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panorama/feature/accounts/account_page_bloc/account_page_bloc.dart';
import 'package:panorama/feature/core/appbar.dart';
import 'package:panorama/feature/core/bottom_navigation_bar.dart';
import 'package:panorama/feature/core/fab.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountPageBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const PanoramaAppBarTitle(),
        ),
        body: Placeholder(),
        floatingActionButton: PanoramaFloatingActionButton(),
        bottomNavigationBar: const PanoramaBottomNavBar(),
      ),
    );
  }
}
