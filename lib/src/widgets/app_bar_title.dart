import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  AppBarTitle({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: TextStyle(
            fontFamily: 'CooperBlack',
            fontSize: 24,
            color: Theme.of(context).hintColor),
      ),
      Text(subtitle,
          style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor)),
    ]);
  }
}