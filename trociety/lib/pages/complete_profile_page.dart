import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../scoped_model/main.dart';
import 'home_page.dart';
import 'package:intl/intl.dart';
import './loggin_in_page.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class CompleteProfilePage extends StatefulWidget {
  String email;
  String societyRef;

  CompleteProfilePage({this.email, this.societyRef});

  @override
  _CompleteProfilePageState createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  String name;

  final formats = {
    InputType.time: DateFormat("HH:mm"),
  };

  String contactNumber;

  String officeAddress;

  DateTime departureTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Complete your profile"),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (String s) {
                  setState(() {
                    name = s;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Contact",
                ),
                onChanged: (String s) {
                  setState(() {
                    contactNumber = s;
                  });
                },
              ),
              ScopedModelDescendant<MainModel>(
                builder: (BuildContext context, Widget child, MainModel model) {
                  return RaisedButton(
                    child: Text("Update"),
                    onPressed: () {
                      Firestore.instance
                          .collection("users")
                          .document(model.society.ref)
                          .collection("residents")
                          .where("email", isEqualTo: widget.email.toLowerCase())
                          .getDocuments()
                          .then(
                        (userSnapshot) {
                          print("Reaching here");
                          Firestore.instance
                              .collection("users")
                              .document(model.society.ref)
                              .collection("residents")
                              .document(userSnapshot.documents[0].documentID)
                              .setData({
                            'uid': userSnapshot.documents[0].documentID,
                            "isValidated": true,
                            "name": name,
                            "contactNumber": contactNumber,
                            "email": widget.email,
                            "societyRef": widget.societyRef,
                          }).then((s) async {
                            await model.updateData(
                                widget.email, model.society.ref);

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return LoggingInPage();
                            }));
                          });
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
