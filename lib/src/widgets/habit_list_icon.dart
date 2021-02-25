import 'package:accountable/src/models/habit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HabitListIcon extends StatelessWidget {
  final Habit habit;

  HabitListIcon({this.habit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/view');
        },
        child: Padding(
            padding: EdgeInsets.all(20),
            child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width < 1024 ? 120 : 130,
                    height:
                        MediaQuery.of(context).size.width < 1024 ? 120 : 130,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                habit.emoji,
                                style: TextStyle(
                                    fontSize: 36,
                                    color: Theme.of(context).hintColor),
                              )),
                          Spacer(),
                          Text(habit.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor)),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text('✨ ' + habit.streak.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
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
