import 'package:accountable/src/widgets/notification_dialog.dart';
import 'package:flutter/material.dart';
import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/providers/emoji_keyboard.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class EditEmojiButton extends StatelessWidget {
  final Habit habit;
  EditEmojiButton({this.habit});
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextButton(
              child: Text(
                habit.emoji,
                style:
                    TextStyle(fontSize: 54, color: Theme.of(context).hintColor),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (UniversalPlatform.isWeb) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                      return NotificationDialog(
                        title: "Emoji Keyboard not available for web",
                        description:
                            "Sorry, Emojis can only be added throguh the mobile app. You can still add new activities, and then edit them later.",
                      );
                      });
                } else {
                  Provider.of<KeyboardNotifier>(context, listen: false)
                      .updateKeyboard(
                          !context.read<KeyboardNotifier>().showKeyboard);
                }
              },
            ));
  }
}
