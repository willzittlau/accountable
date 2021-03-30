import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/widgets/edit_habit/edit_habit_emoji_button.dart';
import 'package:accountable/src/widgets/edit_habit/edit_habit_name_field.dart';
import 'package:accountable/src/widgets/emoji_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EditHabitPageIcon extends StatelessWidget {
  final Habit habit;
  EditHabitPageIcon({this.habit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        width: 180,
                        height: 180,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              EditEmojiButton(habit: habit),
                              EditNameField(habit: habit),
                            ]),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset:
                                  Offset(2, 2), // changes position of shadow
                            ),
                          ],
                          color: Theme.of(context).accentColor.withOpacity(0.9),
                        )))),
            // Keyboard
            EmojiKeyboard(habit: habit),
          ],
        ),
      ],
    );
  }
}
