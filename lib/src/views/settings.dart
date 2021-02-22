import 'package:accountable/src/providers/app_theme.dart';
import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:accountable/src/widgets/switch_theme_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screen Header
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title:
            AppBarTitle(title: 'settings.', subtitle: 'edit your experience'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close, color: Theme.of(context).hintColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: Center(child: SettingsPage()),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Provider.of<ThemeNotifier>(context, listen: false)
                .updateTheme(!context.read<ThemeNotifier>().isDarkMode);
          },
          tooltip: 'Change Theme',
          label: Text(
              context.watch<ThemeNotifier>().isDarkMode ? 'Dark' : 'Light',
              style: TextStyle(fontSize: 16)),
          icon: Icon(
              (context.watch<ThemeNotifier>().isDarkMode
                  ? Icons.nights_stay_outlined
                  : Icons.wb_sunny_outlined),
              color: Theme.of(context).hintColor)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Screen Content
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 800, minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[]))));
    });
  }
}
