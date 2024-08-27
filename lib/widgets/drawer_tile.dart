
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final Widget icon;
  final String text;
  final void Function()? onTap;
  const DrawerTile({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: onTap,
    );
  }
}