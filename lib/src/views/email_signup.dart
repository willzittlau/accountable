import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:accountable/src/widgets/notification_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailSignUpScreen extends StatefulWidget {
  static String id = 'sign-up';
  final String message =
      "An email has just been sent to you, Click the link provided to complete registration";

  @override
  _EmailSignUpScreenState createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  String _email;

  String _password;

  Future signUp() async {
    _formKey.currentState.save();
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      await newUser.user.sendEmailVerification();
      if (newUser != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return NotificationDialog(
                  title: "Success!",
                  description:
                      "An email confirmation to activate your account has been sent to $_email, Click the link provided to complete the process. If you don't see an email within 5 minutes please check your junk/spam folder.");
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return NotificationDialog(
                title: "There was an error.", description: e.toString());
          });
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
            AppBarTitle(title: 'accountable.', subtitle: 'become a better you'),
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
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign up.',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontFamily: 'Yrsa',
                          fontWeight: FontWeight.bold,
                        )),
                    TextFormField(
                      onSaved: (emailValue) {
                        _email = emailValue;
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
                    TextFormField(
                      obscureText: true,
                      onSaved: (passValue) {
                        _password = passValue;
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(
                          Icons.lock,
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
                    SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.brown[50]),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Colors.black, width: 1.5)),
                      ),
                      onPressed: signUp,
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
