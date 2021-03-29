import 'package:accountable/src/models/habit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddHabitPageIcon extends StatelessWidget {
  final Habit habit;
  final TextEditingController _controller = TextEditingController();
  AddHabitPageIcon({this.habit});

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      final String text = _controller.text;
      habit.name = text;
      habit.emoji = (true) ? habit.name.toUpperCase()[0] : habit.emoji;
    });
    return Padding(
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
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          color: Theme.of(context).hintColor,
                          iconSize: 72,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        width: 120.0,
                        height: 40,
                        child: TextField(
                            controller: _controller,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
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
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                  color: Theme.of(context).accentColor.withOpacity(0.9),
                ))));
  }
}
