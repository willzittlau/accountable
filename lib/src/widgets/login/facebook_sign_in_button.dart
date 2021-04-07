import 'package:accountable/src/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:accountable/src/utils/authentication.dart';

class FacebookSignInButton extends StatefulWidget {
  @override
  _FacebookSignInButtonState createState() => _FacebookSignInButtonState();
}

class _FacebookSignInButtonState extends State<FacebookSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? Container(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ))
          : Container(
              width: 280.0,
              height: 60.0,
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    _isSigningIn = true;
                  });
                  User user =
                      await Authentication.signInWithGoogle(context: context);

                  setState(() {
                    _isSigningIn = false;
                  });

                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/img/fb_logo.png"),
                        height: 35.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Sign in with Facebook',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
