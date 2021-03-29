import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/providers/emoji_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:provider/provider.dart';

class AddHabitPageIcon extends StatelessWidget {
  final Habit habit;
  final TextEditingController _controller = TextEditingController();
  AddHabitPageIcon({this.habit});

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      // Sets emoji to first letter of name entry if null
      final String text = _controller.text;
      habit.name = text;
      habit.emoji.isEmpty
          ? habit.emoji = habit.name.toUpperCase()[0]
          : habit.emoji = habit.emoji;
    });
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
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                color: Theme.of(context).hintColor,
                                iconSize: 72,
                                onPressed: () {
                                  Provider.of<KeyboardNotifier>(context,
                                          listen: false)
                                      .updateKeyboard(!context
                                          .read<KeyboardNotifier>()
                                          .showKeyboard);
                                },
                              ),
                              Container(
                                width: 120.0,
                                height: 60,
                                child: TextField(
                                    maxLength: 15,
                                    controller: _controller,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        hintText: 'Add a Name',
                                        contentPadding: EdgeInsets.all(8))),
                              )
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
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: (context.watch<KeyboardNotifier>().showKeyboard
                    ? EmojiPicker(
                        rows: 4,
                        columns: 7,
                        buttonMode: ButtonMode.MATERIAL,
                        onEmojiSelected: (emoji, category) {
                          habit.emoji = emoji.emoji;
                          Provider.of<KeyboardNotifier>(context, listen: false)
                              .updateKeyboard(!context
                                  .read<KeyboardNotifier>()
                                  .showKeyboard);
                        },
                      )
                    : Container())),
          ],
        ),
      ],
    );
  }
}
