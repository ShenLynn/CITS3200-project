import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:asthma_app/models/user.dart';

class DatabaseService {
  //constructor
  final String username;
  DatabaseService({this.username});

  //collection reference
  final CollectionReference personalInfoColletion =
  FirebaseFirestore.instance.collection('PersonalInfo2');

  Future updataUserData(String fullname, String dob, String phonenumber,
      int age, String address, String personalid, String aboutme) async {
    return await personalInfoColletion.doc(username).set({
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
    print("this is username" + username);
    return UserData(
        uid: username,
        fullname: snapshot.data()['fullname'] ?? "",
        dob: snapshot.data()['dob'] ?? "",
        phonenumber: snapshot.data()['phonenumber'] ?? "",
        age: snapshot.data()['age'] ?? "",
        address: snapshot.data()['address'] ?? "",
        personalid: snapshot.data()['personalid'] ?? "",
        aboutme: snapshot.data()['aboutme'])?? "";
  }

  Stream<UserData> get personalInfo {

    return personalInfoColletion.doc(username).snapshots().map(_userDataFromSnapshot);
  }
}