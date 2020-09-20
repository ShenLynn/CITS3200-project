import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> _answers = ['Took sterioids', 'Took antibiotics', 'Went to hospital'];
var _q2selectedOption;

final q1Controller =  TextEditingController();
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;
final userName = user.displayName;


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
  await FirebaseFirestore.instance.collection("Asthma attacks")
      .doc("$userName").collection('Record Asthma attacks')
      .doc().set({
    'When did you have the attack?': q1Controller.text,
    'What actions did you take?': _q2selectedOption


  });

}



