import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/widgets/add_habit_page_icon.dart';
import 'package:accountable/src/widgets/add_habit_stats.dart';
import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

// Screen Header
class AddHabitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: AppBarTitle(
              title: 'something new.', subtitle: 'start tracking a new habit'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close, color: Theme.of(context).hintColor),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        body: Center(child: AddHabitPage()));
  }
}

// Screen Content
class AddHabitPage extends StatelessWidget {
  final habit =  Habit(name: ' ');
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
                    AddHabitPageIcon(habit: habit),
                    AddHabitStats(habit: habit)
                  ])));
    });
  }
}
