import 'package:asthma_app/pages/MyTreatments.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


final TreatmentNameController =  TextEditingController();
final TreatmentDeviceController =  TextEditingController();
final TreatmentDosageController =  TextEditingController();
final TreatmentDurationController =  TextEditingController();

final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;
final userName = user.displayName;

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
                  Text('Deviced used for this treatment:',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: TreatmentDeviceController,
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
                  Text('Treatment dosage',
                      style: TextStyle(fontWeight :FontWeight.bold)),
                  TextFormField(
                    controller: TreatmentDosageController,
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
  await FirebaseFirestore.instance.collection("Treatments")
      .doc("$userName").collection('Individual Treatments')
      .doc(TreatmentNameController.text).set({
    'Name of the Treatment': TreatmentNameController.text,
    'Treatment Dosage': TreatmentDosageController.text,
    'Treatment Device': TreatmentDeviceController.text,
    'Treatment Duration': TreatmentDurationController.text,
  });

}