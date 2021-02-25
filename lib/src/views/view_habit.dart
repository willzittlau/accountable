import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/providers/app_theme.dart';
import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:accountable/src/widgets/habit_page_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screen Header
class ViewHabitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: AppBarTitle(
            title: 'statistics.', subtitle: 'look how far you\'ve come'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close, color: Theme.of(context).hintColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: Center(child: ViewHabitPage()),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/edit');
          },
          tooltip: 'Change Theme',
          label: Text('Edit', style: TextStyle(fontSize: 16)),
          icon: Icon((Icons.edit_outlined),
              color: Theme.of(context).hintColor)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Screen Content
class ViewHabitPage extends StatelessWidget {
  final Habit test = Habit(
      name: 'Drinks',
      emoji: '🍺',
      notes: 'hey',
      streak: 1,
      average: 1,
      best: 1,
      numResets: 1);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 800, minHeight: constraints.maxHeight),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    HabitPageIcon(habit: test),
                  ])));
    });
  }
}
