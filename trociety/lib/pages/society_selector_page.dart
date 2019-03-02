import 'package:flutter/material.dart';
import './auth_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class SocietySelectorPage extends StatefulWidget {
  @override
  SocietySelectorPageState createState() {
    return SocietySelectorPageState();
  }
}

class SocietySelectorPageState extends State<SocietySelectorPage> {
  String scannedValue;
  bool status = false;
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey[900],
          mini: true,
          elevation: 0.0,
          child: Icon(Icons.help),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.blue[100],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50.0),
              child: TextField(
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  fillColor: Colors.white70,
                  disabledBorder: InputBorder.none,
                  helperStyle: TextStyle(color: Colors.white70),
                  counterStyle: TextStyle(color: Colors.white70),
                  hintStyle: TextStyle(color: Colors.white70),
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "Enter your 6 digit society code",
                ),
                autofocus: true,
                maxLength: 6,
                onChanged: (String value) {
                  scannedValue = value;
                },
              ),
            ),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () async {
                print("Scanned :$scannedValue");

                Firestore.instance
                    .collection("societies")
                    .where('ref', isEqualTo: scannedValue.toLowerCase())  
                    .getDocuments()
                    .then(
                  (socSnapshot) {
                    if (socSnapshot.documents.length == 0) {
                      print("Nikal");
                      return showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Society not found"),
                            content: Text("Click on help icon for more info"),
                          );
                        }
                      );
                      
                    }
                    if (socSnapshot.documents[0].data["ref"].toString() ==
                        scannedValue.toLowerCase()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return AuthPage();
                          },
                        ),
                      );
                    } else {
                      print("Alert to be made");
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
