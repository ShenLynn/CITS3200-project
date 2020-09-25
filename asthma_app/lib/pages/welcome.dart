import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:asthma_app/pages/signIn.dart';
import 'package:asthma_app/pages/sign_up.dart';
import 'package:flutter/painting.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asthma For You'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 130),
          Text("Welcome!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 30,
          ),),
          SizedBox(height: 80),
          RaisedButton(
            color: Colors.blue[900],
            splashColor: Colors.deepOrange[500],
            animationDuration: Duration(seconds: 2),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)
            ),
            onPressed: NavigateToSignIn,
            child:Row( mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(' Sign In', style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 5,),
                Icon(Icons.login_sharp, color: Colors.white,)
              ],
            )
          ),
          SizedBox(height: 10),
          RaisedButton(
            color: Colors.blue[900],
            splashColor: Colors.deepOrange[500],
            animationDuration: Duration(seconds: 2),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15)
            ),
            onPressed: NavigateToSignUp,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,

              children: [Text(' Sign Up',
                style: TextStyle(
                    color: Colors.white
                ),),
                SizedBox(width: 10,),
                Icon(Icons.create, color: Colors.white,),]
            ),
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
