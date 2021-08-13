import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:accountable/src/models/habit.dart';
import 'package:flutter/material.dart';

class ViewHabitCalendar extends StatelessWidget {
  final Habit habit;

  ViewHabitCalendar({this.habit});

  final EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  @override
  Widget build(BuildContext context) {
    List<DateTime> markedDates = [];

    for (int i= 0; i < habit.streak; i++) {
      markedDates.add(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - i)
      );
    }

    var len = markedDates.length;
    CalendarCarousel _calendarCarousel;

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        markedDates[i],
        new Event(
          date: markedDates[i],
        ),
      );
    }

    _calendarCarousel = CalendarCarousel<Event>(
      // header colors
      headerTextStyle:
          TextStyle(fontSize: 18, color: Theme.of(context).hintColor),
      weekdayTextStyle: TextStyle(
        color: Theme.of(context).hintColor,
      ),
      iconColor: Theme.of(context).hintColor,
      // main calendar
      weekendTextStyle: TextStyle(
        color: Theme.of(context).hintColor,
      ),
      daysTextStyle: TextStyle(
        color: Theme.of(context).hintColor,
      ),
      todayTextStyle: TextStyle(
        color: Theme.of(context).hintColor,
      ),
      todayButtonColor: Colors.transparent,
      dayButtonColor: Colors.transparent,
      todayBorderColor: Theme.of(context).hintColor,
      // thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 420.0,
      daysHaveCircularBorder: true,
      disableDayPressed: true,
      isScrollable: true,
      markedDateWidget: Container(),
      markedDateCustomShapeBorder: CircleBorder(
          side: BorderSide(
        color: Theme.of(context).hintColor,
      )),
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: false,
      markedDateIconMaxShown: 5,
      markedDateMoreShowTotal:
          null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.0),
          child: _calendarCarousel,
        ),
      ),
    ]);
  }
}
