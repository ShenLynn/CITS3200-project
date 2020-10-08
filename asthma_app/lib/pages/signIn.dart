import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:asthma_app/main.dart';
<<<<<<< HEAD
import 'package:asthma_app/pages/services/analytics_service.dart';
=======
import 'package:google_fonts/google_fonts.dart';
>>>>>>> 8840669cafaf1cd0ee6445f4bdf4ab8a030ba1cb
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
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
<<<<<<< HEAD
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
              onPressed: signIn,
              child: Text(' Sign in'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  resetpassword = !resetpassword;
                });
              },
              child: Text('Forgot my password'),
            ),
            resetpassword ?
            Column(
                  children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return "Enter your email to reset your password.";
                  }
                },
                controller: resetpasswordController,
                decoration: InputDecoration(labelText: 'Enter your email to reset your password'),
              ), RaisedButton(
                      onPressed: () {
                        auth.sendPasswordResetEmail(
                            email: resetpasswordController.text).then((
                            processvalue) {
                        }).catchError((error) {
                          print("there was an error");
                        });
                      }
                    ),
            ],
            ): Container()
          ],
=======
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return "you have not entered anything";
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                    labelText: 'Email',
                  fillColor: Colors.blue[900],
                  focusColor:Colors.blue[900] ,
                  hoverColor: Colors.blue[900],
                  border: OutlineInputBorder(),),
              ), SizedBox(height: 10,),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return "Your password is too short";
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                    labelText: 'Password',
                  fillColor: Colors.blue[900],
                  focusColor:Colors.blue[900] ,
                  hoverColor: Colors.blue[900],
                  border: OutlineInputBorder(),),
                obscureText: true,
              ),
              RaisedButton(
                color: Colors.blue[900],
                splashColor: Colors.deepOrange[500],
                animationDuration: Duration(seconds: 2),
                onPressed: signIn,
                child: Text(' Sign in',
                style: TextStyle(color: Colors.white),),
              )
            ],
          ),
>>>>>>> 8840669cafaf1cd0ee6445f4bdf4ab8a030ba1cb
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
        await AnalyticsService().setUserProperties(user_email:user.email);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Calendar()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}

