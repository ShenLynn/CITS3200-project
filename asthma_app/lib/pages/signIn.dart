import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:asthma_app/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Calendar()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
