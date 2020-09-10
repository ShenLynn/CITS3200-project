import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _titleController = TextEditingController();
final _descController = TextEditingController();
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;

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
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter an event title",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "An event title must be supplied";
                    }
                   }
                )
              ],
            ),
          ),
        )
    );
  }
}
