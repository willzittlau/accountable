import 'package:accountable/src/models/habit.dart';
import 'package:flutter/material.dart';

class HabitStats extends StatelessWidget {
  final Habit habit;

  HabitStats({this.habit});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Text(
            'Notes: ' + habit.notes,
            style: TextStyle(
                fontFamily: 'CooperBlack',
                fontSize: 24,
                color: Theme.of(context).hintColor),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
          child: Text(
            'Current: ' + habit.streak.toString(),
            style: TextStyle(
                fontFamily: 'CooperBlack',
                fontSize: 24,
                color: Theme.of(context).hintColor),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
            'Best: ' + habit.best.toString(),
            style: TextStyle(
                fontFamily: 'CooperBlack',
                fontSize: 24,
                color: Theme.of(context).hintColor),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
            'Average: ' + habit.average.toString(),
            style: TextStyle(
                fontFamily: 'CooperBlack',
                fontSize: 24,
                color: Theme.of(context).hintColor),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Text(
            'Number of resets: ' + habit.numResets.toString(),
            style: TextStyle(
                fontFamily: 'CooperBlack',
                fontSize: 24,
                color: Theme.of(context).hintColor),
          )),
    ]);
  }
}
