import 'dart:ui';
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
final q6Controller =  TextEditingController();
final q7Controller =  TextEditingController();
final q8Controller =  TextEditingController();
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userName = user.displayName;
final userid = user.uid;


class form1 extends StatefulWidget {
  @override
  _form1State createState() => _form1State();
}

class _form1State extends State<form1> {
  final databaseReference = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Asthma Quality Life Questionnaire'),
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
                  Text('Feel SHORT OF BREATH as a result of your asthma?',
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
                  Text('Feel bothered by or have to avoid DUST in the environment?',
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
                  Text('Fell FRUSTRATED as a result of your asthma?',
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
                  Text('Feel bothered by COUGHING?',
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
                  Text('Feel AFRAID OF NOT HAVING YOUR ASTHMA MEDICATION AVAILABLE?',
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
                  Text('Experience a feeling of CHEST TIGHTNESS OR CHEST HEAVINESS?',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: q6Controller,
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
                  Text('Have DIFFICULTY GETTING A GOOD NIGHTS SLEEP as a result of your asthma?',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: q7Controller,
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
      .doc("$userName").collection('Mini-Asthma-Quality-Life-Questionnaire')
      .doc().set({
    'firebaseuid' : userid,
    'Name': nameController.text,
    'PatientID': patientidController.text,
    'How often do you feel breathlessness?': q1Controller.text,
    'Feel bothered by or have to avoid DUST in the environment?': q2Controller.text,
    'Fell FRUSTRATED as a result of your asthma?':q3Controller.text,
    'Feel bothered by COUGHING?': q4Controller.text,
    'Feel AFRAID OF NOT HAVING YOUR ASTHMA MEDICATION AVAILABLE?': q5Controller.text,
    'Experience a feeling of CHEST TIGHTNESS OR CHEST HEAVINESS?':q6Controller.text,
    'Have DIFFICULTY GETTING A GOOD NIGHTS SLEEP as a result of your asthma?' :q7Controller.text

  });

}



