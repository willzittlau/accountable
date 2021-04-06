import 'package:flutter/material.dart';
import 'package:accountable/src/utils/authentication.dart';
import 'package:accountable/src/widgets/google_sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/img/logo.png',
                        height: 250,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
      child:FittedBox(
                      fit: BoxFit.scaleDown,
                      child:Text(
                      'accountable.',
                      style: TextStyle(
                          fontFamily: 'CooperBlack',
                          fontSize: 72,
                          color: Colors.black),
                    ))),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
      child:FittedBox(
                      fit: BoxFit.scaleDown,
                      child:Text(
                      'become a better you',
                      style: TextStyle(
                        fontFamily: 'Yrsa',
                        color: Colors.black,
                        fontSize: 40,
                        
                      ),
                    ))),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center (child: Text('Error initializing Firebase'));
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.black,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
