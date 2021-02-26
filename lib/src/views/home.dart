import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:accountable/src/widgets/habit_list_icon.dart';
import 'package:accountable/src/widgets/list_fade.dart';
import 'package:flutter/material.dart';

// Screen Header
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title:
            AppBarTitle(title: 'accountable.', subtitle: 'become a better you'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(Icons.more_horiz, color: Theme.of(context).hintColor))
        ],
      ),
      body: MediaQuery.of(context).size.width < 800
          ? HomePage()
          : Center(child: HomePage()),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          tooltip: 'Add a habit',
          child: Icon(Icons.add)),
    );
  }
}

// Screen Content
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListFade(
        child: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 60),
                  child: Row(
                    mainAxisAlignment: MediaQuery.of(context).size.width < 800
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          ListView.builder(
                            itemCount: habits.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index.isEven) {
                                return HabitListIcon(habit: habits[index]);
                              } else {
                                return Container();
                              }
                            },
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          ListView.builder(
                            itemCount: habits.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index.isOdd) {
                                return HabitListIcon(habit: habits[index]);
                              } else {
                                return Container();
                              }
                            },
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ],
                      )),
                    ],
                  ),
                ))));
  }
}

List<Habit> habits = [
  Habit(
      name: 'Drinking',
      emoji: '🍺',
      notes: 'Drinking',
      streak: 1,
      average: 2,
      best: 3,
      numResets: 4),
  Habit(
      name: 'Yoga',
      emoji: '🧘',
      notes: 'Yoga',
      streak: 4,
      average: 2,
      best: 1,
      numResets: 2),
  Habit(
      name: 'Vegan',
      emoji: '🌱',
      notes: 'Vegan',
      streak: 3,
      average: 41,
      best: 15,
      numResets: 13),
  Habit(
      name: 'Code',
      emoji: '👨‍💻',
      notes: 'Code',
      streak: 11,
      average: 11,
      best: 11,
      numResets: 11),
  Habit(
      name: 'Workout',
      emoji: '💪',
      notes: 'workout',
      streak: 19,
      average: 91,
      best: 19,
      numResets: 91),
  Habit(
      name: 'Meditate',
      emoji: '🙏',
      notes: 'Meditate',
      streak: 15,
      average: 51,
      best: 15,
      numResets: 51),
  Habit(
      name: 'Sleep',
      emoji: '💤',
      notes: 'Sleep',
      streak: 1,
      average: 1,
      best: 1,
      numResets: 1),
  Habit(
      name: 'Read',
      emoji: '📚',
      notes: 'Reading',
      streak: 1,
      average: 1,
      best: 1,
      numResets: 1),
  Habit(
      name: 'French',
      emoji: '🇫🇷',
      notes: 'Learn French',
      streak: 1,
      average: 1,
      best: 1,
      numResets: 1),
];