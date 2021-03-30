import 'package:accountable/src/models/habit.dart';
import 'package:flutter/material.dart';

class AddHabitNotes extends StatefulWidget {
  final Habit habit;
  AddHabitNotes({this.habit});
  NotesFieldWidget createState() => NotesFieldWidget(habit: habit);
}

class NotesFieldWidget extends State {
  static TextEditingController _controller;
  final Habit habit;
  NotesFieldWidget({this.habit});

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
        habit.notes = text;
      }
    });

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Text('Notes: ',
            style: TextStyle(
                fontFamily: 'Yrsa',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hintColor)),
      ),
      Container(
          constraints: BoxConstraints(maxWidth: 500),
          child: TextFormField(
              onFieldSubmitted: (String str) {
                setState(() {
                  _controller.text = str;
                });
              },
              controller: _controller,
              textInputAction: TextInputAction.done,
              minLines: 5,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).hintColor, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: 'Add extra info'))),
    ]);
  }
}
