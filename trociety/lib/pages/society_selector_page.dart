import 'package:flutter/material.dart';
import './auth_page.dart';
import 'package:flutter/cupertino.dart';

class SocietySelectorPage extends StatefulWidget {
  @override
  SocietySelectorPageState createState() {
    return SocietySelectorPageState();
  }
}

class SocietySelectorPageState extends State<SocietySelectorPage> {
  String scannedValue;

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
      backgroundColor: Colors.blueGrey[900],
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
                autofocus:  true,
                maxLength: 6,
                
                onChanged: (String value) {
                  scannedValue = value;
                },
              ),
            ),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                print(scannedValue.toUpperCase());

                //check with DB response as status
                bool status = true;

                if (status) {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                      builder: (BuildContext context) {
                        return AuthPage();
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
