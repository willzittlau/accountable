import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              "accountable.", style: TextStyle(fontFamily: 'CooperBlack', fontSize: 24),
            ),
            GestureDetector(
              child: Text('become a better you', style: TextStyle(fontSize: 14)),
              onTap: () {
                print("tapped subtitle");
              },
            )
          ]);
  }
}
