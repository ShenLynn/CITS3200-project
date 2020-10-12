import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;

class SubmittedForm1 extends StatefulWidget {
  @override
  _SubmittedForm1State createState() => _SubmittedForm1State();
}

class _SubmittedForm1State extends State<SubmittedForm1>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your submitted forms'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Forms")
              .doc("$userid").collection('Mini-Asthma-Quality-Life-Questionnaire')
              .snapshots(),
          builder: (context,snapshots){
            if (snapshots.data == null) return CircularProgressIndicator();
            return ListView.builder(
              itemCount: snapshots.data.documents.length,
              itemBuilder: (context,index){
                DocumentSnapshot form1 = snapshots.data.docs[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text('Form number $index',style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Patient Name:'+'  '+ form1.data()['Name'],textAlign: TextAlign.left),
                      Text('PatientID:'+'  '+ form1.data()['PatientID'],textAlign: TextAlign.left),
                      Text('How often do you feel breathlessness?:'+'  '+ form1.data()['How often do you feel breathlessness?']),
                      Text('Feel bothered by or have to avoid DUST in the environment?:'+'  '+ form1.data()['Feel bothered by or have to avoid DUST in the environment?']),
                    ],
                  ),
                );
              },
            );
          }
      ),
    );
  }
}


