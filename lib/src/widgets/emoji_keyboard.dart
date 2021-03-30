import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/providers/emoji_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:provider/provider.dart';

class EmojiKeyboard extends StatelessWidget {
  final Habit habit;
  EmojiKeyboard({this.habit});

  @override
  Widget build(BuildContext context) {
    return (context.watch<KeyboardNotifier>().showKeyboard
        ? Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: EmojiPicker(
              rows: 4,
              columns: 7,
              buttonMode: ButtonMode.MATERIAL,
              onEmojiSelected: (emoji, category) {
                habit.emoji = emoji.emoji;
                Provider.of<KeyboardNotifier>(context, listen: false)
                    .updateKeyboard(
                        !context.read<KeyboardNotifier>().showKeyboard);
              },
            ))
        : Container());
  }
}
