import 'package:flutter/material.dart';
import 'package:accountable/src/models/habit.dart';

class EditNameField extends StatelessWidget {
  final Habit habit;
  final TextEditingController _controller = TextEditingController();
  EditNameField({this.habit});

  @override
  Widget build(BuildContext context) {
    _controller.text = habit.name;
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
    _controller.addListener(() {
      // Sets emoji to first letter of name entry if null
      final String text = _controller.text;
      if (text.length > 0) {
        habit.name = text;
      }
    });
    return Container(
      width: 120.0,
      height: 60,
      child: TextField(
          onSubmitted: (String str) {
            if (str.length > 0) {
              habit.name = str;
            }
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
