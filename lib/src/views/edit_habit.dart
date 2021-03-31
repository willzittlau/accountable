import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/providers/emoji_keyboard.dart';
import 'package:accountable/src/views/view_habit.dart';
import 'package:accountable/src/widgets/edit_habit/edit_habit_notes.dart';
import 'package:accountable/src/widgets/edit_habit/edit_habit_page_icon.dart';
import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accountable/src/widgets/edit_habit/delete_habit_dialog.dart';

// Screen Header
class EditHabitScreen extends StatelessWidget {
  final Habit habit;
  EditHabitScreen({this.habit});
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
                  heroTag: "delete",
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
                  tooltip: 'Delete Habit',
                  child: Icon(Icons.delete_outline)),
              FloatingActionButton(
                heroTag: "acceptChanges",
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: 'Accept Changes',
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
                  children: <Widget>[
                    EditHabitPageIcon(habit: habit),
                    Offstage(
                      child: EditHabitNotes(habit: habit),
                      offstage: context.watch<KeyboardNotifier>().showKeyboard,
                    )
                  ])));
    });
  }
}
