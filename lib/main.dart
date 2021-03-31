import 'package:accountable/src/providers/app_theme.dart';
import 'package:accountable/src/providers/emoji_keyboard.dart';
import 'package:accountable/src/theme/styles.dart';
import 'package:accountable/src/views/add_habit.dart';
import 'package:accountable/src/views/home.dart';
import 'package:accountable/src/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()),
          ChangeNotifierProvider<KeyboardNotifier>(create: (context) => KeyboardNotifier())
        ],
        child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier theme, child) {
          return MaterialApp(
            title:'accountable.',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/settings': (context) => SettingsScreen(),
              '/add': (context) => AddHabitScreen(),
            },
          );
        }));
  }
}