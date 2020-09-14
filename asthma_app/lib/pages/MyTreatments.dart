import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;

class MyTreatments extends StatefulWidget {
  @override
  _MyTreatmentsState createState() => _MyTreatmentsState();
}

class _MyTreatmentsState extends State<MyTreatments> {

  Future<bool> updateDialog(BuildContext context, selectedDoc) async {
    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
          return AlertDialog(
            title: Text('Update Data'),
            content: Column(
              children: [
                TextField(

                )
              ],
            ),
          );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Treatments'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Treatments").doc("$userid").collection('Individual Treatments').snapshots(),
        builder: (context,snapshots){
          if (snapshots.data == null) return CircularProgressIndicator();
            return ListView.builder(
                itemCount: snapshots.data.documents.length,
                itemBuilder: (context,index){
                  DocumentSnapshot treatments = snapshots.data.docs[index];
                  return Center(
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           ListTile(
                            leading: Icon(Icons.pages),
                            title: Text(treatments.data()['Name of the Treatment'],style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                            ),
                             subtitle: Text(treatments.data()['Treatment Usage']),
                           ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child:Text('DELETE'),
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('Treatments')
                                      .doc('$userid')
                                      .collection('Individual Treatments')
                                      .doc(snapshots.data.docs[index].documentID)
                                      .delete();
                                },
                              ),
                              FlatButton(
                                child: const Text('EDIT'),
                                onPressed: () {
                                },
                              ),
                        ],

                      ),
                    ]
                      ),
                  )
                  );
                }
            );
          }
      ),
    );
  }
}

void updateData(selectedDoc, newValues) {
  FirebaseFirestore.instance.collection("Treatments").doc('$userid').collection('Individual Treatments').doc(selectedDoc).update(newValues);
}
