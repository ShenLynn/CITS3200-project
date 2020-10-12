import 'package:asthma_app/forms/form1.dart';
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
                  Text('Please answer the below questions on a scale from 0-6',
                      style: TextStyle(fontWeight :FontWeight.bold, color: Colors.red)),
                  SizedBox(height: 20,),
                  Text('Q1) On average, during the past week, how often were you woken by your asthma during the night?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('0. Never ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('1. Hardly Ever',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. A Few Minutes',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. Several Times',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Many Times',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A Great Many Times',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Unable to sleep because of asthma',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
                  DropdownButton(
                    value: _q1selectedOption,
                    onChanged: (newValue){
                      setState(() {_q1selectedOption = newValue;
                      });
                  },
                      items:_answers.map((location){
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                  ),

                  Text('Q2) On average, during the past week, how bad were your asthma symptoms when you woke up in the morning?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('0. No Symptoms ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('1. Very Mild Symptoms ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Mild Symptoms',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. Moderate Symptoms',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Quite Severe Symptoms',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. Severe Symptoms',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Very Severe Symptoms',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
               DropdownButton(
                 isExpanded: true,
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
                  Text('Q3) In general, during the past week how limited where are you in your activities because of your asthma?',
                      style: TextStyle(fontWeight :FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('0. Not Limited At All',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('1. Very Slightly Limited ',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. Slightly Limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. Moderately Limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Very Limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. Extremely Limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. Totaly Limited',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
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
                  Text('Q4) In general, during the past week, how much shortness of breath did you experience because of your asthma?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('0. None',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('1. A Very Little',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. A Little',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A Moderate Amount',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. Quite A Lot',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. A Great Deal',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. A Very Great Deal',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
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
                  Text('q5) In general, during the past week, how much of the time did you wheeze?',
                      style: TextStyle(fontWeight :FontWeight.bold,fontSize: 20)),
                  SizedBox(height: 4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('0. Not At All',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('1. Hardly Any Of The Time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('2. A Little Of The Time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('3. A Moderate Amount Of The Time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('4. A Lot Of The Time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('5. Most Of The Time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                      Text('6. All The Time',style: TextStyle(fontWeight :FontWeight.bold,fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 4,),
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
      .doc("$userName").collection('ACQ-5')
      .doc().set({
    'Submitted at': DateTime.now(),
    'Score':calculateFinalScore(int.parse(_q1selectedOption),
                                int.parse(_q2selectedOption),
                                int.parse(_q3selectedOption),
                                int.parse(_q4selectedOption),
                                int.parse(_q5selectedOption)),
  });

}



