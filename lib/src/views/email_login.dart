import 'package:accountable/src/views/home.dart';
import 'package:accountable/src/widgets/app_bar_title.dart';
import 'package:accountable/src/widgets/notification_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailSignInScreen extends StatefulWidget {
  @override
  _EmailSignInScreenState createState() => _EmailSignInScreenState();
}

class _EmailSignInScreenState extends State<EmailSignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  String _email;

  String _password;

  Future signIn() async {
    _formKey.currentState.save();
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (user.user.emailVerified) {
        print('verified');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    } catch (e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return NotificationDialog(
                  title: "There was an error.",
                  description:
                      "Please check your email and password and try again!");
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
            AppBarTitle(title: 'settings.', subtitle: 'edit your experience'),
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
                    Text(
                      'Sign In Here',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
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
                    TextFormField(
                      onSaved: (newPass) {
                        _password = newPass;
                      },
                      obscureText: true,
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
                    RaisedButton(
                      onPressed: () {
                        signIn();
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
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
