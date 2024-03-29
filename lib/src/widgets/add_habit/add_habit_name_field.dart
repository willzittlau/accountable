import 'package:flutter/material.dart';
import 'package:accountable/src/models/habit.dart';

class AddNameField extends StatefulWidget {
  final Habit habit;
  AddNameField({this.habit});
  AddTextFieldWidget createState() => AddTextFieldWidget(habit: habit);
}

class AddTextFieldWidget extends State {
  static TextEditingController _controller;
  final Habit habit;
  AddTextFieldWidget({this.habit});

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      // Sets emoji to first letter of name entry if null
      final String text = _controller.text;
      if (text.length > 0) {
        habit.name = text;
        habit.emoji.isEmpty
            ? habit.emoji = habit.name.toUpperCase()[0]
            : habit.emoji = habit.emoji;
      }
    });
    return Container(
      width: 120.0,
      height: 60,
      child: TextField(
          onSubmitted: (String str) {
            setState(() {
              _controller.text = str;
            });
          },
          maxLength: 15,
          controller: _controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              hintText: 'Add a Name',
              contentPadding: EdgeInsets.all(8))),
    );
  }
}
