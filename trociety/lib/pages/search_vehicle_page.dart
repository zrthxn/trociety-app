import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../pages/showInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchVehiclePage extends StatefulWidget {
  @override
  _SearchVehiclePageState createState() => _SearchVehiclePageState();
}

class _SearchVehiclePageState extends State<SearchVehiclePage> {
  String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Search a vehicle"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (String a) {
                setState(() {
                  number = a;
                });
              },
            ),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                Firestore.instance
                    .collection("vehicles")
                    .where("numberPlate", isEqualTo: number.toUpperCase())
                    .getDocuments()
                    .then((vehicleSnapshot) {
                  if (vehicleSnapshot.documents.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("User not found"),
                            content: Text("Not a resident of your society"),
                          );
                        });
                  } else {
                    Firestore.instance
                        .collection("users")
                        .document(vehicleSnapshot
                            .documents[0].data["ownerSocietyRef"])
                        .collection("residents")
                        .where("uid",
                            isEqualTo:
                                vehicleSnapshot.documents[0].data["ownerUID"])
                        .getDocuments()
                        .then((userSnap) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ShowInfo(
                          name: userSnap.documents[0].data["name"],
                          contact: userSnap.documents[0].data["contactNumber"],
                          email: userSnap.documents[0].data["email"],
                          numberPlate:
                              vehicleSnapshot.documents[0].data["numberPlate"],
                        );
                      }));
                    });
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
