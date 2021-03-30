import 'package:flutter/material.dart';
import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/providers/emoji_keyboard.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class AddEmojiButton extends StatelessWidget {
  final Habit habit;
  AddEmojiButton({this.habit});
  @override
  Widget build(BuildContext context) {
    return habit.emoji.isEmpty
        ? IconButton(
            icon: const Icon(Icons.face),
            color: Theme.of(context).hintColor,
            iconSize: 72,
            onPressed: () {
              FocusScope.of(context).unfocus();
              Provider.of<KeyboardNotifier>(context, listen: false)
                  .updateKeyboard(
                      !context.read<KeyboardNotifier>().showKeyboard);
            },
          )
        : Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextButton(
              child: Text(
                habit.emoji,
                style:
                    TextStyle(fontSize: 54, color: Theme.of(context).hintColor),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                Provider.of<KeyboardNotifier>(context, listen: false)
                    .updateKeyboard(
                        !context.read<KeyboardNotifier>().showKeyboard);
              },
            ));
  }
}
