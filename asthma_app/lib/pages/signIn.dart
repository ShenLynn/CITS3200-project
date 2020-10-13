import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:asthma_app/main.dart';
import 'package:asthma_app/pages/services/analytics_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar.dart';

final resetpasswordController = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  bool resetpassword = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return "you have not entered anything";
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return "Your password is too short";
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () =>[setState((){resetpassword = false;  }), signIn()  ],
              child: Text(' Sign In'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  resetpassword = !resetpassword;
                });
              },
              child: Text('Forgot My Password'),
            ),
            resetpassword
                ? Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Enter your email to reset your password.";
                          }
                        },
                        controller: resetpasswordController,
                        decoration: InputDecoration(
                            labelText:
                                'Enter your email to reset your password'),
                      ),
                      RaisedButton(onPressed: () {
                        auth
                            .sendPasswordResetEmail(
                                email: resetpasswordController.text)
                            .then((processvalue) {})
                            .catchError((error) {
                          print("there was an error");
                        });
                      },
                        child: Text("Send Reset Link")
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  void signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await Firebase.initializeApp();
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        User user = result.user;
        await AnalyticsService().setUserProperties(user_email: user.email);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Calendar()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
