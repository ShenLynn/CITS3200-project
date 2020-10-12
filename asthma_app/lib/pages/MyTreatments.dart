import 'package:asthma_app/pages/AddTreatments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final userid = user.uid;
final userName = user.displayName;

class MyTreatments extends StatefulWidget {
  @override
  _MyTreatmentsState createState() => _MyTreatmentsState();
}

class _MyTreatmentsState extends State<MyTreatments> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Treatments'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Treatments").doc("$userName").collection('Individual Treatments').snapshots(),
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
                             subtitle: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(treatments.data()['Treatment Dosage'],style:TextStyle(fontWeight :FontWeight.bold, fontSize: 16),),
                                 Text('Devices Used:'+'  '+ treatments.data()['Treatment Device'],style:TextStyle(fontWeight :FontWeight.bold, fontSize: 16),)
                               ],
                             ),
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
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue[900],
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>AddTreatments()));
            }
        )
    );
  }
}

void updateData(selectedDoc, newValues) {
  FirebaseFirestore.instance.collection("Treatments").doc('$userid').collection('Individual Treatments').doc(selectedDoc).update(newValues);
}
