import 'package:flutter/material.dart';

class ScreenWithAppBar {
  final Widget screen;
  final String title;
  final List<Widget>? actions;

  const ScreenWithAppBar({
    required this.screen,
    required this.title,
    this.actions,
  });
}
