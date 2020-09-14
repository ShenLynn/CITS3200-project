import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class profilelist extends StatefulWidget {
  @override
  _profilelistState createState() => _profilelistState();
}

class _profilelistState extends State<profilelist> {
  @override
  Widget build(BuildContext context) {
    final profiles = Provider.of<QuerySnapshot>(context);
    for (var doc in profiles.docs){
      print(doc.data);
    }
    return Container(

    );
  }
}
