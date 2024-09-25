import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:panorama/feature/navigation/bloc/app_navigation_bloc.dart';

class PanoramaFloatingActionButton extends StatelessWidget {
  const PanoramaFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {},
          child: const Icon(FontAwesome.plus_solid),
        );
      },
    );
  }
}
