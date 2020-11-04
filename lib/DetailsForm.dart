import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_app/QR_Code.dart';

import 'CustomTextField.dart';
import 'Details.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final _details = Details();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Fill you Details Below'),
            ),
            body: Column(children: <Widget>[
              TextFormField(
                controller: nameCtrl,
                decoration: CommonStyle.textFieldStyle(labelTextStr:"Username",hintTextStr:"Enter Username"),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneCtrl,
                decoration: CommonStyle.textFieldStyle(labelTextStr:"Contact Number",hintTextStr:"Enter Contact Number"),
                // The validator receives the text that the user has entered.
                keyboardType: TextInputType.phone,
                validator: validatePhone,

              ),
              TextFormField(
                controller: addressCtrl,
                decoration: CommonStyle.textFieldStyle(labelTextStr:"Address",hintTextStr:"Enter Address"),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },

              ),
              TextFormField(
                controller: emailCtrl,
                decoration: CommonStyle.textFieldStyle(labelTextStr:"Email",hintTextStr:"Enter Email"),
                // The validator receives the text that the user has entered.
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
              ),
              ElevatedButton(
                onPressed: () {
                  _details.name = nameCtrl.text;
                  _details.address = addressCtrl.text;
                  _details.phone = phoneCtrl.text;
                  _details.email = emailCtrl.text;
                  String json = jsonEncode(_details);

                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QRCode(json)));
                  }

                },
                child: Text('Submit'),
              ),

              // Add TextFormFields and ElevatedButton here.
            ])));
  }
  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
      return !regex.hasMatch(value) ? 'Enter Valid Email' : null;
  }

  String validatePhone(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }

    Pattern pattern =
        r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regex = new RegExp(pattern);
    return !regex.hasMatch(value) ? 'Enter Valid Phone Number' : null;

  }
}


