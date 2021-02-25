import 'package:accountable/src/models/habit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HabitPageIcon extends StatelessWidget {
  final Habit habit;

  HabitPageIcon({this.habit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
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
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                habit.emoji,
                                style: TextStyle(
                                    fontSize: 48,
                                    color: Theme.of(context).hintColor),
                              )),
                          Spacer(),
                          Text(habit.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).hintColor)),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              child: Text('✨ ' + habit.streak.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).hintColor))),
                        ]),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(2, 2), // changes position of shadow
                        ),
                      ],
                      color: Theme.of(context).accentColor.withOpacity(0.9),
                    )))));
  }
}
