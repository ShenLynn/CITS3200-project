import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:cloud_firestore_platform_interface/src/set_options.dart';
import 'package:intl/intl.dart';

final _titleController = TextEditingController();
final _descController = TextEditingController();
TextEditingController _dateController = TextEditingController();
DateTime _chosenDate;
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
final User user = auth.currentUser;
final userid = user.uid;
final format = DateFormat("yyyy-MM-dd");

class addEvent extends StatefulWidget {
  @override
  _addEventState createState() => _addEventState();
}

class _addEventState extends State<addEvent> {
  //final databaseReference = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text("Add Event"),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Event Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ) ,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _titleController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Colors.blue[900],
                    focusColor:Colors.blue[900] ,
                    hoverColor: Colors.blue[900],
                    border: OutlineInputBorder(),
                    hintText: "Enter an event title",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "An event title must be supplied";
                    }
                   }
                ),
                SizedBox(height: 40),
                Text(
                    "Event Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                )),
                SizedBox(height:20),
                DateTimeField(
                  controller: _dateController,
                  format: format,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    fillColor: Colors.blue[900],
                    focusColor:Colors.blue[900] ,
                    hoverColor: Colors.blue[900],
                    border: OutlineInputBorder(),
                    hintText: "Tap to enter a date",
                  ),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100)
                    ); //.then((date) {
                      //setState(() {
                       // _chosenDate = date;
                       // print(_chosenDate);
                      //});
                   // });
                  },
                ),
                SizedBox(height: 40),
                FlatButton(
                  color: Colors.blue[900],
                    onPressed: (){
                   // print(_dateController.text);
                   // print(_titleController.text);
                   // print(userid);
                    createEvent();
                    Navigator.pop(context, true);
                    },
                    child: Text(
                        "Add Event",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}

void createEvent() async {

  await FirebaseFirestore.instance.collection("events1").doc(userid).collection("event").doc(_dateController.text).setData(
    {
      "events" : FieldValue.arrayUnion([_titleController.text])
    },
    SetOptions(merge: true)).then((_) {
      print("Record successfully added");
  });
}

  /**await FirebaseFirestore.instance.collection("events").doc(userid).collection(_dateController.text).doc(_dateController.text).setData(
    {
      "date" : _dateController.text,
      "tasks" : FieldValue.arrayUnion([_titleController.text])
    },
    SetOptions(merge: true)).then((_) {
      print("success!");
  });
   } **/
/**class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Select an event date (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}**/

