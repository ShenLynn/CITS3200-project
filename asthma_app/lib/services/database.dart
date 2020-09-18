import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:asthma_app/models/user.dart';

class DatabaseService {
  //constructor
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference personalInfoColletion =
      FirebaseFirestore.instance.collection('PersonalInfo');
  Future updataUserData(String fullname, String dob, String phonenumber,
      int age, String address, String personalid, String aboutme) async {
    return await personalInfoColletion.doc(uid).set({
      'fullname': fullname,
      'dob': dob,
      'phonenumber': phonenumber,
      'age': age,
      'address': address,
      'personalid': personalid,
      'aboutme': aboutme
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        fullname: snapshot.data()['name'],
        dob: snapshot.data()['dob'],
        phonenumber: snapshot.data()['phonenumber'],
        age: snapshot.data()['age'],
        address: snapshot.data()['address'],
        personalid: snapshot.data()['personalid'],
        aboutme: snapshot.data()['aboutme']);
  }

  Stream<UserData> get personalInfo {
    return personalInfoColletion
        .doc(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
