import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:asthma_app/pages/signIn.dart';
import 'package:asthma_app/services/database.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password, _fullname;
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
              onSaved: (input) => _fullname = input,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            Text(
              'Please make sure the name you type is the exact same as your name on hospital documents',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
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
                if (input.length < 8) {
                  return "Your password is too short";
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signUp,
              child: Text(' Sign Up'),
            )
          ],
        ),
      ),
    );
  }

  void signUp() async {
    final formState = _formKey.currentState;
    FirebaseAuth auth = FirebaseAuth.instance;
    if (formState.validate()) {
      formState.save();
      try {
        await Firebase.initializeApp();
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        await FirebaseAuth.instance.currentUser.updateProfile(displayName:_fullname);
        User user = result.user;
        String userUserName = user.displayName;
        await DatabaseService(username: _fullname).updataUserData(
            'Firstname middlename lastname',
            'DD/MM/YYYY',
            'Enter phone number with country code',
            20,
            'Enter your full address',
            'Enter your patient ID',
            'Hi i am a new user',
            'Clinicianemail@gmail.com');
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
