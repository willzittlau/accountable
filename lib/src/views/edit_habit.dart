import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:accountable/src/widgets/delete_habit_dialog.dart';
import 'package:flutter/material.dart';

// Screen Header
class EditHabitScreen extends StatelessWidget {
  final Habit habit;
  EditHabitScreen({this.habit});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: AppBarTitle(
            title: 'change it up.', subtitle: 'edit the current habit'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.keyboard_return,
                  color: Theme.of(context).hintColor),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: Center(child: EditHabitPage(habit: habit)),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DeleteHabitDialog(
                    title: "Delete this Habit?",
                    description:
                        "Are you sure you want to delete '${habit.name}\'? This action cannot be undone.",
                    btnText: "Cancel",
                    btn2Text: "Yes",
                    habit: habit,
                  );
                });
          },
          tooltip: 'Add a habit',
          child: Icon(Icons.delete_outline)),
    );
  }
}

// Screen Content
class EditHabitPage extends StatelessWidget {
  final Habit habit;
  EditHabitPage({this.habit});
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
                  children: <Widget>[Text(habit.best.toString())])));
    });
  }
}
