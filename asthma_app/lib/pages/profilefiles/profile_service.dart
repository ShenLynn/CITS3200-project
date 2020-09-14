import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:asthma_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:asthma_app/pages/profileclass.dart';

class ProfileService {
  final String uid;
  ProfileService({this.uid});

  final DocumentReference profileDocument = FirebaseFirestore.instance.collection('PersonalInfoMock').doc("MyalO2VLOqenNibtojG5");

  personalinfo _personalinfoFromSnapshot(DocumentSnapshot doc){
        print(doc);
        return personalinfo(
          fullname: doc.data()["Fullname"] ?? "",
          email: doc.data()["Email"] ?? "",
          number: doc.data()["number"] ?? "",
        );
      }


  Stream<personalinfo> get profiles{
    return profileDocument.snapshots().map(_personalinfoFromSnapshot);
  }

}
