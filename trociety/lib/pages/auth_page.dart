import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';
import './home_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './complete_profile_page.dart';
import './loggin_in_page.dart';

class AuthPage extends StatefulWidget {
  FirebaseUser firebaseAuth;

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  Widget buildFields() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.08,
          child: ScopedModelDescendant(
            builder: (BuildContext context, Widget child, MainModel model) {
              //print(model.society.sid);
              return SignInButton(
                Buttons.Google,
                onPressed: () =>
                    model.signIn().then((GoogleSignInAccount user) {
                      print(user.email);

                      Firestore.instance
                          .collection("users")
                          .document(model.society.ref)
                          .collection("residents")
                          .where("email", isEqualTo: user.email.toLowerCase())
                          .getDocuments()
                          .then((userSnapshot) {
                        // print(userSnapshot.documents[0].data);
                        if (userSnapshot.documents.length == 0) {
                          print("if running");
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("User not found"),
                                  content: Text("Recheck your account"),
                                );
                              });
                        } else {
                          if (userSnapshot.documents[0].data["isValidated"]) {
                            model.updateData(user.email, model.society.ref);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return LoggingInPage();
                              }),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return CompleteProfilePage(
                                  email: user.email,
                                  societyRef: model.society.ref,
                                );
                              }),
                            );
                          }
                        }
                      });
                    }).catchError((e) => print(e)),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
        shape: RoundedRectangleBorder(),
        icon: Icon(Icons.arrow_back),
        label: Text(
          "Change Society",
          textScaleFactor: 0.9,
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blueGrey[900].withBlue(50).withOpacity(0.98),
        child: buildFields(),
      ),
    );
  }
}
