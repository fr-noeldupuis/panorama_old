import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:panorama/feature/core/appbar.dart';
import 'package:panorama/feature/core/body.dart';
import 'package:panorama/feature/core/bottom_navigation_bar.dart';
import 'package:panorama/feature/core/fab.dart';
import 'package:panorama/feature/navigation/bloc/app_navigation_bloc.dart';
import 'package:panorama/utils/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.cyanM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.cyanM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      home: BlocProvider(
        create: (context) => AppNavigationBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const PanoramaAppBarTitle(),
          ),
          body: const PanoramaBody(),
          floatingActionButton: PanoramaFloatingActionButton(),
          bottomNavigationBar: const PanoramaBottomNavBar(),
        ),
      ),
    );
  }
}
