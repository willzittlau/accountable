import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/providers/habit_change_property.dart';
import 'package:accountable/src/views/view_habit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class TapAndHoldProgressButton extends StatefulWidget {
  final Habit habit;
  TapAndHoldProgressButton({this.habit});
  @override
  TapAndHoldProgressButtonState createState() =>
      TapAndHoldProgressButtonState(habit: habit);
}

class TapAndHoldProgressButtonState extends State<TapAndHoldProgressButton>
    with SingleTickerProviderStateMixin {
  final Habit habit;
  AnimationController controller;
  TapAndHoldProgressButtonState({this.habit});

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    controller.addListener(() async {
      if (controller.value == 1) {
        // update habit
        habit.manuallyResetStreak();
        await Future.delayed(const Duration(milliseconds: 300));
        Provider.of<HabitNotifier>(context, listen: false).update();
        controller.value = 0;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        transform: Matrix4.translationValues(18, 18, 0.0),
        child: Column(children: <Widget>[
          GestureDetector(
            onTapDown: (_) => controller.forward(),
            onTapUp: (_) {
              if (controller.value < 0.05) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewHabitScreen(habit: habit),
                    ));
              }
              if (controller.status == AnimationStatus.forward) {
                controller.reverse();
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width < 1024
                          ? 124.0
                          : 134.0,
                      width: MediaQuery.of(context).size.width < 1024
                          ? 124.0
                          : 134.0,
                      child: CircularProgressIndicator(
                        value: controller.value,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).hintColor),
                      ),
                    )),
                Visibility(
                    visible: controller.value > 0 ? true : false,
                    child: Icon(
                      Icons.cancel,
                      color: Theme.of(context).hintColor,
                      size: 64,
                    )),
              ],
            ),
          ),
          Opacity(
              opacity: controller.value > 0 ? 1 : 0,
              child: Container(
                  transform: Matrix4.translationValues(0.0, 5.0, 0.0),
                  child: Text('Reset streak?')))
        ]));
  }
}
