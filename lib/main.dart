import 'package:accountable/src/providers/app_theme.dart';
import 'package:accountable/src/providers/emoji_keyboard.dart';
import 'package:accountable/src/providers/habit_change_property.dart';
import 'package:accountable/src/theme/styles.dart';
import 'package:accountable/src/views/add_habit.dart';
import 'package:accountable/src/views/home.dart';
import 'package:accountable/src/views/login.dart';
import 'package:accountable/src/views/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool isLogged() {
    try {
      final user = _firebaseAuth.currentUser;
      return user != null;
    } catch (e) {
      return false;
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Auth _auth = Auth();
  final bool isLogged = _auth.isLogged();
  final App app = App(
    initialRoute: isLogged ? '/home' : '/',
  );
  runApp(app);
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  final String initialRoute;

  App({this.initialRoute});

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong :('));
          } else if (snapshot.hasData) {
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
                    themeMode:
                        theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                    initialRoute: initialRoute,
                    routes: {
                      '/': (context) => SignInScreen(),
                      '/home': (context) => HomeScreen(),
                      '/settings': (context) => SettingsScreen(),
                      '/add': (context) => AddHabitScreen(),
                    },
                  );
                }));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
