import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
DocumentSnapshot snapshot;
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;

class MyForms extends StatefulWidget {
  @override
  _MyFormsState createState() => _MyFormsState();
}

class _MyFormsState extends State<MyForms>  {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Mini-Asthma-Quality-Life-Questionnaire').doc('$userid').snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if (snapshot.connectionState == ConnectionState.active){
            var courseDocument = snapshot.data.data;
            return ListView.builder(itemBuilder: (_, int index) {
                return ListTile(title: Text(courseDocument[index]['name']));
              },
            );
          }
        }
    );
  }
}

