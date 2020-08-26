import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Page that will contain all app forms
class FormsPage extends StatefulWidget {
  @override
  _FormsPageState createState() => _FormsPageState();
}



class _FormsPageState extends State<FormsPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form1')),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Builder(
          builder: (context) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child: Text('submit'),
                      ))
                ],
              )
          ),
        ),
      ),
    );
  }
}
