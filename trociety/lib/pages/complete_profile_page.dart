import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../scoped_model/main.dart';
import 'home_page.dart';

class CompleteProfilePage extends StatelessWidget {
  String name;
  String email;
  String contactNumber;
  String ss;
  String societyRef;

  CompleteProfilePage({this.email, this.societyRef});

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
                  name = s;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Contact",
                ),
                onChanged: (String s) {
                  contactNumber = s;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Something else maybe",
                ),
                onChanged: (String s) {
                  ss = s;
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
                          .where("email", isEqualTo: email.toLowerCase())
                          .getDocuments()
                          .then(
                        (userSnapshot) {
                          Firestore.instance
                              .collection("users")
                              .document(model.society.ref)
                              .collection("residents")
                              .document(userSnapshot.documents[0].documentID)
                              .setData({
                            "isValidated": true,
                            "name": name,
                            "contactNumber": contactNumber,
                            "email": email,
                            "societyRef": societyRef
                          }).then((s) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return HomePage();
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
