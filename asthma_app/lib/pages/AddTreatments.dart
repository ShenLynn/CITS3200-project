import 'package:asthma_app/pages/MyTreatments.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:asthma_app/pages/services/analytics_service.dart';
import 'package:google_fonts/google_fonts.dart';

final nameController = TextEditingController();
final patientidController =  TextEditingController();
final TreatmentNameController =  TextEditingController();
final String nameOfTreatment = TreatmentNameController.text;
final TreatmentUsageController =  TextEditingController();
final TreatmentNotesController =  TextEditingController();
final TreatmentDurationController =  TextEditingController();
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;

class AddTreatments extends StatefulWidget {
  @override
  _AddTreatmentsState createState() => _AddTreatmentsState();
}

class _AddTreatmentsState extends State<AddTreatments> {
  final databaseReference = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add A New Treatment'),
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
                  Text('Name of the Treatment',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: TreatmentNameController,
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
                  Text('Treatment Usage:',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: TreatmentUsageController,
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
                  Text('Notes about the treatment:',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: TreatmentNotesController,
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
                  Text('Treatment duration:',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: TreatmentDurationController,
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
                  RaisedButton(child: Text('Submit Treatment'),
                    onPressed:(){
                      createRecord();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyTreatments()));
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
  await AnalyticsService().setUserPropertiesTreatment(treatment: TreatmentNameController.text);
  await FirebaseFirestore.instance.collection("Treatments")
      .doc("$userid").collection('Individual Treatments')
      .doc('$nameOfTreatment').set({
    'firebaseuid' : userid,
    'Name': nameController.text,
    'PatientID': patientidController.text,
    'Name of the Treatment': TreatmentNameController.text,
    'Treatment Usage': TreatmentUsageController.text,
    'Treatment Notes':TreatmentNotesController.text,
    'Treatment Duration': TreatmentDurationController.text,
  });

}