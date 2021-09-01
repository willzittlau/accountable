import 'dart:convert';
import 'package:accountable/src/models/globals.dart';
import 'package:accountable/src/models/habit.dart';
import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:accountable/src/widgets/home/habit_list_icon.dart';
import 'package:accountable/src/widgets/home/tap_and_hold_progress_bar.dart';
import 'package:accountable/src/widgets/list_fade.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firestoreInstance = FirebaseFirestore.instance;

// Screen Header
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("users").doc(firebaseUser.uid).set({
      "name": firebaseUser.displayName,
      "email": firebaseUser.email,
      "habits": jsonEncode(habits)
    });
    for (Habit habit in habits) {
      habit.updateBest();
      habit.updateAvg();
      habit.autoUpdateStreak();
    }
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: AppBarTitle(
                title: 'accountable.', subtitle: 'become a better you'),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  icon: Icon(Icons.more_horiz,
                      color: Theme.of(context).hintColor))
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
        ));
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
                                return Stack(children: [
                                  HabitListIcon(habit: habits[index]),
                                  TapAndHoldProgressButton(
                                      habit: habits[index]),
                                ]);
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
                                return Stack(children: [
                                  HabitListIcon(habit: habits[index]),
                                  TapAndHoldProgressButton(
                                      habit: habits[index]),
                                ]);
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
