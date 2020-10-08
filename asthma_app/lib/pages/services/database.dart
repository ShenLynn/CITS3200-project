import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:asthma_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  //constructor
  final String username;
  DatabaseService({this.username});

  //collection reference
  final CollectionReference personalInfoColletion =
  FirebaseFirestore.instance.collection('PersonalInfo2');

  Future updataUserData(String fullname, String dob, String phonenumber,
      int age, String address, String personalid, String aboutme) async {
    return await personalInfoColletion.doc(getcurrentUsername()).set({
      'fullname': fullname,
      'dob': dob,
      'phonenumber': phonenumber,
      'age': age,
      'address': address,
      'personalid': personalid,
      'aboutme': aboutme
    });
  }

  Future updateUserProfile(String fullname, String dob, String phonenumber,
      String aboutme) async {
    return await personalInfoColletion.doc(getcurrentUsername()).update({
      'fullname': fullname,
      'dob': dob,
      'phonenumber': phonenumber,
      'aboutme': aboutme
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    print(snapshot);
    return UserData(
        fullname: snapshot.data()['fullname'] ?? "",
        dob: snapshot.data()['dob'] ?? "",
        phonenumber: snapshot.data()['phonenumber'] ?? "",
        age: snapshot.data()['age'] ?? "",
        address: snapshot.data()['address'] ?? "",
        personalid: snapshot.data()['personalid'] ?? "",
        aboutme: snapshot.data()['aboutme'])?? "";
  }

  String getcurrentUsername(){
    final FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser.displayName;
  }

  Stream<UserData> get personalInfo {
    return personalInfoColletion.doc(getcurrentUsername()).snapshots().map(_userDataFromSnapshot);
  }
}