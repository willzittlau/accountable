import 'package:accountable/src/models/habit.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AddHabitStartDate extends StatefulWidget {
  final Habit habit;
  AddHabitStartDate({this.habit});
  DateFieldWidget createState() => DateFieldWidget(habit: habit);
}

class DateFieldWidget extends State {
  final Habit habit;
  DateFieldWidget({this.habit});

  static DateTime startDate = DateTime.now();
  final DateFormat formatter = DateFormat('yMMMMd');

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context)
                  .scaffoldBackgroundColor, // header background color
              onPrimary: Theme.of(context).hintColor, // header text color
              onSurface: Theme.of(context).hintColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Theme.of(context).hintColor, // button text color
              ),
            ),
          ),
          child: child,
        );
      },
      context: context,
      initialDate: startDate,
      firstDate: DateTime(startDate.year - 3),
      lastDate: DateTime.now(),
    );
    if (picked != null)
      setState(() {
        habit.startDate = picked.toUtc();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Text('Start Date: ',
            style: TextStyle(
                fontFamily: 'Yrsa',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hintColor)),
      ),
      OutlinedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ))),
        onPressed: () => _selectDate(context),
        child: Text(
          formatter.format(habit.startDate).toString(),
          style: TextStyle(
              color: Theme.of(context).hintColor, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
