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
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;


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
          title: Text('Questionnaire on Cough Impact'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'PLEASE ENTER YOUR NAME',
                        hintStyle: TextStyle(color: Colors.grey)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Text('Patient ID',style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: patientidController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'PLEASE ENTER YOUR PATIENT ID',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Text('In the last 2 weeks have you had chest or stomach pains as a result of your cough?',
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
      .doc("$userid").collection('Questionnaire on Cough Impact')
      .doc().set({
    'firebaseuid' : userid,
    'Name': nameController.text,
    'PatientID': patientidController.text,
    'In the last 2 weeks have you had chest or stomach pains as a result of your cough?': q1Controller.text,
    'In the last 2 weeks have been bothered by sputum(phlegm) production when you cough?': q2Controller.text,
    'In the last 2 weeks have you been tired because of your cough?':q3Controller.text,
    'In the last 2 weeks, have you felt in control of your cough?': q4Controller.text,
    'In the last 2 weeks, have you felt embarrased by your coughing?': q5Controller.text,


  });

}



