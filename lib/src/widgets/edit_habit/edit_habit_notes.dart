import 'package:accountable/src/models/habit.dart';
import 'package:flutter/material.dart';

class EditHabitNotes extends StatelessWidget {
  final Habit habit;
  final TextEditingController _controller = TextEditingController();
  EditHabitNotes({this.habit});

  @override
  Widget build(BuildContext context) {
    _controller.text = habit.notes;
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
    _controller.addListener(() {
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
                habit.notes = str;
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
