import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:accountable/src/widgets/notification_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  final String message =
      "An email has just been sent to you, Click the link provided to complete password reset";

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String _email;

  _passwordReset() async {
    try {
      _formKey.currentState.save();
      final user = await _auth.sendPasswordResetEmail(email: _email);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return NotificationDialog(
                title: "Success!",
                description:
                    "An email to reset your password has been sent to $_email, Click the link provided to complete the process. If you don't see an email within 5 minutes please check your junk/spam folder.");
          });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title:
            AppBarTitle(title: 'Forgot?', subtitle: 'reset your password'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close, color: Theme.of(context).hintColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email Your Email',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  TextFormField(
                    onSaved: (newEmail) {
                      _email = newEmail;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      errorStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    child: Text('Send Email'),
                    onPressed: () {
                      _passwordReset();
                      print(_email);
                    },
                  ),
                  FlatButton(
                    child: Text('Sign In'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
