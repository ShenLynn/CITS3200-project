import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;
final userName = user.displayName;

List<String> _answers = ['Took sterioids', 'Took antibiotics', 'Went to hospital'];
var _q2selectedOption;
final q1Controller =  TextEditingController();
final pinController =  TextEditingController();


class form3 extends StatefulWidget {
  @override
  _form3State createState() => _form3State();
}

class _form3State extends State<form3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Record an Asthma attack'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('When did you have the attack(Enter your answer in DD/MM/YYYY)?',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: q1Controller,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'PLEASE ENTER YOUR ANSWER',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Text('What actions did you take?',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  DropdownButton(
                    value: _q2selectedOption,
                    onChanged: (newValue){
                      setState(() {_q2selectedOption= newValue;
                      });
                    },

                    items:_answers.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  Text('Please enter your 4-digit pin[Make sure',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: pinController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'PLEASE ENTER YOUR PIN',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your pin';
                      }
                      return null;
                    },
                  ),
                  Text(checkIfPinEntered(pinController), style: TextStyle(fontWeight :FontWeight.bold, color: Colors.red),
                  ),
                  RaisedButton(child: Text('Submit Form'),
                    onPressed:(){
                    createRecord();
                    _formKey.currentState.reset();
                    Navigator.pushNamed(context, 'forms_page');
                    },
                  )
                ],
              )
          ), //center
        )
    );
  }
}

String checkIfPinEntered(var a){
  if(a == null){
    return "You have not yet entered your 4-digit pin, please type it in before you submit the form";
  }
  return "You may press the button below and submit the form";
}

void createRecord() async {
  await FirebaseFirestore.instance.collection("Asthma attacks")
      .doc("$userName").collection('Record Asthma attacks')
      .doc().set({
    'time': q1Controller.text,
    'action_taken': _q2selectedOption,
    'pin': pinController.text
  });

}



