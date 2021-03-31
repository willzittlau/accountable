import 'dart:ui';
import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteHabitDialog extends StatelessWidget {
  final String title, description, btnText, btn2Text;
  final Habit habit;

  const DeleteHabitDialog({
    Key key,
    this.title,
    this.description,
    this.btnText,
    this.btn2Text,
    this.habit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 500),
      padding: EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 20),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(1, 5), blurRadius: 10),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    btnText,
                    style: TextStyle(fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {
                    habits.remove(this.habit);
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text(
                    btn2Text,
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
