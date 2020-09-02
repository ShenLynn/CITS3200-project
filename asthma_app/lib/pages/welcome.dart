import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asthma_app/pages/signIn.dart';
import 'package:asthma_app/pages/sign_up.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aasthma For You'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            onPressed: NavigateToSignIn,
            child: Text(' Sign In'),
          ),
          RaisedButton(
            onPressed: NavigateToSignUp,
            child: Text(' Sign Up'),
          ),
        ],
      ),
    );
  }

 void NavigateToSignIn(){
   Navigator.push(
       context, MaterialPageRoute(builder: (context) => LoginPage(),fullscreenDialog: true));
  }

  void NavigateToSignUp(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage(),fullscreenDialog: true));

  }
}
