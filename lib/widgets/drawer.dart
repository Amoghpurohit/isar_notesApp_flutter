import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar_notes/UI/settings.dart';
import 'package:isar_notes/widgets/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                ),
                const SizedBox(width: 45,),
                Text(
                  'Menu',
                  style: GoogleFonts.sansita(fontSize: 30),
                ),
              ],
            ),
          ),
          DrawerTile(
            icon: const Icon(Icons.home),
            text: 'Home',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          DrawerTile(
            icon: const Icon(Icons.settings),
            text: 'Settings',
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
