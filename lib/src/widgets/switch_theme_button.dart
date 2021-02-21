import 'package:accountable/src/providers/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<ThemeNotifier>(context, listen: false)
              .updateTheme(!context.read<ThemeNotifier>().isDarkMode);
        },
        icon: Icon(
            (context.watch<ThemeNotifier>().isDarkMode
                ? Icons.nights_stay_outlined
                : Icons.wb_sunny_outlined),
            color: Theme.of(context).hintColor));
  }
}