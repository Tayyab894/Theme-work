import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/theme_data/theme_notifier.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
   
  @override
  bool is_dark_theme = false;
  Widget build(BuildContext context) {
    context.watch<ThemeNotifier>();
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width - 100,
      height: MediaQuery.of(context).size.height,
      child: InkWell(
        onTap: () {
          is_dark_theme = !is_dark_theme;
          Provider.of<ThemeNotifier>(context, listen: false).SetThemeStatus(
            is_dark_theme,
          );
          Navigator.of(context).pop();
        },
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(Icons.ac_unit,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size)),
      ),
    );
  }
}
