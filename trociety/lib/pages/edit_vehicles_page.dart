import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';
import '../widgets/drawer.dart';
import '../models/vehicle.dart';
import './home_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class AddVehiclesPage extends StatefulWidget {
  @override
  EditVehiclesPageState createState() {
    return EditVehiclesPageState();
  }
}

class EditVehiclesPageState extends State<AddVehiclesPage> {
  final GlobalKey<FormState> editVehicleKey = GlobalKey<FormState>();
  String token;
  String uid;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  String numberPlate;
  String name;
  String type = "car";
  bool isInside;
  @override
  Widget build(BuildContext context) {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((tokenn) {
      print(tokenn);
      token = tokenn;
    });
    _firebaseMessaging.configure(onMessage: (s) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Vejicle Activity"),
              content:
                  Text(s["notification"]["title"] + s["notification"]["body"]),
            ),
      );

      print(s);
    }, onResume: (s) {
      print("onResume");
      print(s);
    }, onLaunch: (s) {
      print("onLaunch");
      print(s);
    });

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Edit your Vehicle(s)"),
      ),
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return Column(children: [
            Container(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.all(3.0),
              child: Center(
                child: Text(
                  "Manage Vehicles",
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Vehicle Number",
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7)),
                onChanged: (String a) {
                  numberPlate = a;
                },
              ),
            ),
            TextField(
              //get from db
              decoration: InputDecoration(
                  labelText: "Car Name",
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.7)),
              onChanged: (String a) {
                name = a;
              },
            ),
            DropdownButton<String>(
                hint: Text("Type of Vehicle"),
                isExpanded: true,
                items: <String>['Car', 'Bike'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String a) {
                  type = a;
                }),
            SwitchListTile(
              value: false,
              onChanged: (bool value) {
                setState(() {
                  isInside = value;
                });
              },
              title: Text('Is the vehicle inside?'),
            ),
            Center(
              child: RaisedButton(
                child: Text("Add"),
                onPressed: () {
                  Firestore.instance
                      .collection("users")
                      .document(model.society.ref)
                      .collection("residents")
                      .where("email", isEqualTo: model.appUser.email)
                      .getDocuments()
                      .then((snap) {
                    if (snap.documents.isNotEmpty) {
                      uid = snap.documents[0].documentID;
                      Firestore.instance.collection("vehicles").add(
                        {
                          "carName": name,
                          "isInside": isInside,
                          "numberPlate": numberPlate,
                          "ownerSocietyRef": model.society.ref,
                          "ownerUID": uid,
                          "type": type,
                          "messagingToken": token,
                        },
                      );
                      Vehicle newV = Vehicle(
                          carName: name,
                          isInside: isInside,
                          numberPlate: numberPlate,
                          type: type);
                      model.listVehicle.add(newV);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HomePage();
                          },
                        ),
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Something went wrong"),
                              content: Text("Please try again"),
                            );
                          });
                    }
                  });
                },
              ),
            )
          ]);
        },
      ),
    );
  }
}
