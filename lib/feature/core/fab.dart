import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class PanoramaFloatingActionButton extends StatelessWidget {
  const PanoramaFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(FontAwesome.plus_solid),
    );
  }
}
