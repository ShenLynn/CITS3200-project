import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final nameController = TextEditingController();
final patientidController =  TextEditingController();
final q1Controller =  TextEditingController();
final q2Controller =  TextEditingController();
final q3Controller =  TextEditingController();
final q4Controller =  TextEditingController();
final q5Controller =  TextEditingController();
List<String> _answers = ['0', '1', '2', '3', '4', '5', '6']; // Option 2
String _q1selectedOption;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final username = user.displayName;


class form2 extends StatefulWidget {
  @override
  _form2State createState() => _form2State();
}

class _form2State extends State<form2> {
  final databaseReference = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ACQ-5'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Please answer the below questions on a scale from 0-6 with 0 being the lest and 6 being the most',
                      style: TextStyle(fontWeight :FontWeight.bold, color: Colors.red)),
                  SizedBox(height: 20,),
                  Text('Q1(Woken during the night)',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  DropdownButton(
                    value: _q1selectedOption,
                    onChanged: (newValue){
                    setState(() {
                      _q1selectedOption= newValue;
                    });
                  },
                      items:_answers.map((location){
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),),
                  Text('$_q1selectedOption'),
                  Text('In the last 2 weeks have been bothered by sputum(phlegm) production when you cough?',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: q2Controller,
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
                  Text('In the last 2 weeks have you been tired because of your cough?',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: q3Controller,
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
                  Text('In the last 2 weeks, have you felt in control of your cough?',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: q4Controller,
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
                  Text('In the last 2 weeks, have you felt embarrased by your coughing?',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: q5Controller,
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
                  RaisedButton(child: Text('Submit Form'),
                    onPressed:(){
                      createRecord();
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

void createRecord() async {
  await FirebaseFirestore.instance.collection("Forms")
      .doc("$username").collection('Questionnaire on Cough Impact')
      .doc().set({
    'PatientID': patientidController.text,
    'In the last 2 weeks have you had chest or stomach pains as a result of your cough?': q1Controller.text,
    'In the last 2 weeks have been bothered by sputum(phlegm) production when you cough?': q2Controller.text,
    'In the last 2 weeks have you been tired because of your cough?':q3Controller.text,
    'In the last 2 weeks, have you felt in control of your cough?': q4Controller.text,
    'In the last 2 weeks, have you felt embarrased by your coughing?': q5Controller.text,


  });

}



