import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';
import './home_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../pages/society_selector_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
              return SignInButton(
                Buttons.Google,
                onPressed: () => model.signIn().then((FirebaseUser user) {
                      print(user);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return HomePage();
                        }),
                      );
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
