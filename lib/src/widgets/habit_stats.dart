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
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                new TextSpan(
                    text: 'Current: ',
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor)),
                new TextSpan(
                    text: habit.streak.toString(),
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 26,
                        color: Theme.of(context).hintColor)),
              ],
            ),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                new TextSpan(
                    text: 'Best: ',
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor)),
                new TextSpan(
                    text: habit.best.toString(),
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 26,
                        color: Theme.of(context).hintColor)),
              ],
            ),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                new TextSpan(
                    text: 'Average: ',
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor)),
                new TextSpan(
                    text: habit.average.toString(),
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 26,
                        color: Theme.of(context).hintColor)),
              ],
            ),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                new TextSpan(
                    text: 'Number of Resets: ',
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor)),
                new TextSpan(
                    text: habit.numResets.toString(),
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 26,
                        color: Theme.of(context).hintColor)),
              ],
            ),
          )),
      Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                new TextSpan(
                    text: 'Notes: ',
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor)),
                new TextSpan(
                    text: habit.notes,
                    style: TextStyle(
                        fontFamily: 'Yrsa',
                        fontSize: 20,
                        color: Theme.of(context).hintColor)),
              ],
            ),
          )),
    ]);
  }
}
