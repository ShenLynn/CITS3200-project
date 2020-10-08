import 'package:asthma_app/pages/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:asthma_app/pages/signIn.dart';
<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';

=======
import 'package:google_fonts/google_fonts.dart';
>>>>>>> 8840669cafaf1cd0ee6445f4bdf4ab8a030ba1cb
class SignUpPage extends StatefulWidget {
  @override
String getUsername() {
  final db  = FirebaseFirestore.instance;
  var personalinfo = db.collection("personalInfo").doc("VRzSF0K0ZHNbksh0OxGZjKrxGeE2");
  String name = "";
  personalinfo.get().then((doc) {
    if (doc.exists) {
      name = doc.data()["fullname"];
      print(name);
      return name;
    }
  }
  );
  return name;
}
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
              decoration: InputDecoration(
                  labelText: 'Email',
                fillColor: Colors.blue[900],
                focusColor:Colors.blue[900] ,
                hoverColor: Colors.blue[900],
                border: OutlineInputBorder(),),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 8) {
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
        print(user.displayName);
        await DatabaseService(username: _fullname).updataUserData(
            'Firstname middname lastname',
            'DD/MM/YYYY',
            'Enter phone number with country code',
            20,
            'Enter your full address',
            'Enter your patient ID',
            'Hi i am a new user');
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}


