import 'package:accountable/src/utils/authentication.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).accentColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      onPressed: () async {
        await Authentication.signOut(context: context);
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Text(
          'Sign Out',
          style: TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}
