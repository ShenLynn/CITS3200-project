import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

final nameController = TextEditingController();
final patientidController =  TextEditingController();

List<String> _answers = ['0', '1', '2', '3', '4', '5', '6'];
var _q1selectedOption;
var _q2selectedOption;
var _q3selectedOption;
var _q4selectedOption;
var _q5selectedOption;

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
  bool _autovalidate = false;
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
              autovalidate: _autovalidate,
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
                      setState(() {_q1selectedOption= newValue;
                      });
                  },

                      items:_answers.map((location){
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                  ),

                  Text('Q2(symptoms in the morning)',
                      style: TextStyle(fontWeight :FontWeight.bold)),
               DropdownButton(
                value: _q2selectedOption,
                onChanged: (newValue){
                  setState(() {
                    _q2selectedOption= newValue;
                  });
                },
                items:_answers.map((location){
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
               ),
                  Text('Q3(day to day activites)',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  DropdownButton(
                    value: _q3selectedOption,
                    onChanged: (newValue){
                      setState(() {
                        _q3selectedOption= newValue;
                      });
                    },
                    items:_answers.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  Text('Q4(shortness of breadth)',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  DropdownButton(
                    value: _q4selectedOption,
                    onChanged: (newValue){
                      setState(() {
                        _q4selectedOption= newValue;
                      });
                    },
                    items:_answers.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  Text('q5(wheeze)',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  DropdownButton(
                    value: _q5selectedOption,
                    onChanged: (newValue){
                      setState(() {
                        _q5selectedOption= newValue;
                      });
                    },
                    items:_answers.map((location){
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                  Text(checkAllAnswers(_q1selectedOption, _q2selectedOption, _q3selectedOption, _q4selectedOption, _q5selectedOption),
                  style: TextStyle(fontWeight :FontWeight.bold, color: Colors.red),),
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

String checkAllAnswers(var a, var b, var c, var d, var e){
  if(a == null || b == null || c == null || d == null || e == null ){
    return 'You have not answered all the questions';
  }
  return 'You have successfully answered all the questions, PLEASE CLICK SUBMIT FORM DOWN BELOW';
}

int calculateFinalScore(var a, var b, var c, var d, var e){
  return ((a+b+c+d+e)~/5);
}

void createRecord() async {
  await FirebaseFirestore.instance.collection("Forms")
      .doc("$username").collection('ACQ-5')
      .doc().set({
    'Submitted at': DateTime.now(),
    'Score':calculateFinalScore(int.parse(_q1selectedOption),
                                int.parse(_q2selectedOption),
                                int.parse(_q3selectedOption),
                                int.parse(_q4selectedOption),
                                int.parse(_q5selectedOption)),
  });

}



