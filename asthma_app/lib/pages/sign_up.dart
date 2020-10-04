import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:asthma_app/pages/signIn.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
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
            ),
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
              onPressed: signUp,
              child: Text(' Sign Up',
                style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }

  void signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        await Firebase.initializeApp();
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}

