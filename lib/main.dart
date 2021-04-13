import 'package:accountable/src/providers/app_theme.dart';
import 'package:accountable/src/providers/emoji_keyboard.dart';
import 'package:accountable/src/providers/habit_change_property.dart';
import 'package:accountable/src/theme/styles.dart';
import 'package:accountable/src/utils/authentication.dart';
import 'package:accountable/src/views/add_habit.dart';
import 'package:accountable/src/views/email_signup.dart';
import 'package:accountable/src/views/forgot_password.dart';
import 'package:accountable/src/views/home.dart';
import 'package:accountable/src/views/login.dart';
import 'package:accountable/src/views/email_login.dart';
import 'package:accountable/src/views/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Authentication.initializeFirebase();
  final bool isLoggedIn = Authentication.userIsLogged();
  final App app = App(
    initialRoute: isLoggedIn ? '/home' : '/',
  );
  runApp(app);
}

class App extends StatelessWidget {
  final String initialRoute;
  final User user;

  App({this.initialRoute, this.user});

  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeNotifier>(
              create: (context) => ThemeNotifier()),
          ChangeNotifierProvider<HabitNotifier>(
              create: (context) => HabitNotifier()),
          ChangeNotifierProvider<KeyboardNotifier>(
              create: (context) => KeyboardNotifier())
        ],
        child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier theme, child) {
          return MaterialApp(
            title: 'accountable.',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: initialRoute,
            routes: {
              '/': (context) => LoginScreen(),
              '/home': (context) => HomeScreen(),
              '/settings': (context) => SettingsScreen(user: FirebaseAuth.instance.currentUser),
              '/add': (context) => AddHabitScreen(),
              '/login': (context) => EmailSignInScreen(),
              '/signup': (context) => EmailSignUpScreen(),
              '/forgot-password': (context) => ForgotPassword(),
            },
          );
        }));
  }
}
