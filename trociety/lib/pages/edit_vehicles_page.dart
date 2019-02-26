import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class EditVehiclesPage extends StatefulWidget {
  @override
  EditVehiclesPageState createState() {
    return EditVehiclesPageState();
  }
}

class EditVehiclesPageState extends State<EditVehiclesPage> {
  final GlobalKey<FormState> editVehicleKey = GlobalKey<FormState>();

  DateTime entryDate;

  DateTime exitDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Edit your Vehicle(s)"),
      ),
      body: Form(
        key: editVehicleKey,
        child: Column(children: [
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
          TextFormField(
            initialValue: "DL9CM9128", //get from db
            decoration: InputDecoration(
                labelText: "Vehicle Number",
                filled: true,
                fillColor: Colors.white.withOpacity(0.7)),
            validator: (String number) {
              if (!RegExp(
                      r"(([A-Za-z]){2,3}(|-)(?:[0-9]){1,2}(|-)(?:[A-Za-z]){2}(|-)([0-9]){1,4})")
                  .hasMatch(number)) {
                return "Enter Valid Car Number";
              }
            },
          ),
          TextFormField(
            initialValue: "My Car", //get from db
            decoration: InputDecoration(
                labelText: "Vehicle Name",
                filled: true,
                fillColor: Colors.white.withOpacity(0.7)),
            validator: (String number) {
              if (!RegExp(
                      r"(([A-Za-z]){2,3}(|-)(?:[0-9]){1,2}(|-)(?:[A-Za-z]){2}(|-)([0-9]){1,4})")
                  .hasMatch(number)) {
                return "Enter Valid Car Number";
              }
            },
          ),
          Center(
            child: RaisedButton(
              child: Text("Update"),
              onPressed: () {
                if (!editVehicleKey.currentState.validate()) {
                  return;
                }
                editVehicleKey.currentState.save();

                Navigator.pop(context);
              },
            ),
          )
        ]),
      ),
    );
  }
}
