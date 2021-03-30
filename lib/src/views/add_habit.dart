import 'package:accountable/src/models/globals.dart';
import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/providers/emoji_keyboard.dart';
import 'package:accountable/src/widgets/add_habit/add_habit_notes.dart';
import 'package:accountable/src/widgets/add_habit/add_habit_page_icon.dart';
import 'package:accountable/src/widgets/add_habit/add_habit_start_date.dart';
import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screen Header
class AddHabitScreen extends StatelessWidget {
  final habit = new Habit();
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        floatingActionButton: Visibility(
            visible: !keyboardIsOpen,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                    heroTag: "close",
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/');
                    },
                    child:
                        Icon(Icons.arrow_back, color: Theme.of(context).hintColor)),
                FloatingActionButton(
                  heroTag: "check",
                  onPressed: () {
                    if (habit.emoji.length > 0) {
                      habits.add(habit);
                    }
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/');
                  },
                  child: Icon(Icons.check, color: Theme.of(context).hintColor),
                ),
              ],
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
        body: Center(child: AddHabitPage(habit: habit)));
  }
}

// Screen Content
class AddHabitPage extends StatelessWidget {
  final Habit habit;
  AddHabitPage({this.habit});
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
                    Offstage(
                      child: AddHabitStartDate(habit: habit),
                      offstage: context.watch<KeyboardNotifier>().showKeyboard,
                    ),
                    Offstage(
                      child: AddHabitNotes(habit: habit),
                      offstage: context.watch<KeyboardNotifier>().showKeyboard,
                    )
                  ])));
    });
  }
}
