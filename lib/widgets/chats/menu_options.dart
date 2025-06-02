import 'package:flutter/material.dart';

class Menuoptions extends StatelessWidget {
  final List<PopupMenuEntry<String>> menuItems;
  final void Function(String value) onSelected;

  const Menuoptions({
    super.key,
    required this.menuItems,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: PopupMenuButton<String>(
        onSelected: onSelected,
        itemBuilder: (context) => menuItems,
        offset: const Offset(0, 40),
        icon: const Icon(
          Icons.more_vert,
          color: Colors.black87,
        ),
        tooltip: 'Options',
      ),
    );
  }
}
