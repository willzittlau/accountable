import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationDialog extends StatelessWidget {
  final String title, description;

  const NotificationDialog({
    Key key,
    this.title,
    this.description,
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Okay',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
