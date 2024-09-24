import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panorama/feature/navigation/bloc/app_navigation_bloc.dart';

class PanoramaBody extends StatelessWidget {
  const PanoramaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return Center(
          child: Text(state.currentPage.title),
        );
      },
    );
  }
}
