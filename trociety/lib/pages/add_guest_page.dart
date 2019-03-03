import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';

class AddGuestPage extends StatefulWidget {
  @override
  AddGuestPageState createState() {
    return AddGuestPageState();
  }
}

class AddGuestPageState extends State<AddGuestPage> {
  final GlobalKey<FormState> guestVehicleKey = GlobalKey<FormState>();
  DateTime entryDate;
  DateTime exitDate;
  String numberPlate;
  String name;
  String type = "car";
  String uid;
  bool isInside = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Add a Guest Vehicle"),
      ),
      body: Form(
        key: guestVehicleKey,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(3.0),
            child: Center(
              child: Text(
                "Add Guest Vehicle",
                textScaleFactor: 1.5,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Guest Name",
                filled: true,
                fillColor: Colors.white.withOpacity(0.7)),
            onChanged: (String number) {
              // if (!RegExp(
              //         r"(([A-Za-z]){2,3}(|-)(?:[0-9]){1,2}(|-)(?:[A-Za-z]){2}(|-)([0-9]){1,4})")
              //     .hasMatch(number)) {
              //   return "Enter Valid Car Number";
              // }

              name = number;
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "Guest Vehical Number",
                filled: true,
                fillColor: Colors.white.withOpacity(0.7)),
            onChanged: (String number) {
              // if (!RegExp(
              //         r"(([A-Za-z]){2,3}(|-)(?:[0-9]){1,2}(|-)(?:[A-Za-z]){2}(|-)([0-9]){1,4})")
              //     .hasMatch(number)) {
              //   return "Enter Valid Car Number";
              // }

              numberPlate = number;
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
          DateTimePickerFormField(
            inputType: InputType.both,
            editable: true,
            format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
            decoration: InputDecoration(
                labelText: 'Entry Date/Time', hasFloatingPlaceholder: false),
            onChanged: (DateTime dt) {
              return setState(() => entryDate = dt);
            },
          ),
          DateTimePickerFormField(
            inputType: InputType.both,
            editable: true,
            format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
            decoration: InputDecoration(
                labelText: 'Exit Date/Time', hasFloatingPlaceholder: false),
            onChanged: (dt) {
              return setState(() => exitDate = dt);
            },
          ),
          Center(child: ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return RaisedButton(
                child: Text("Add Guest"),
                onPressed: () {
                  Firestore.instance
                      .collection("users")
                      .where("email", isEqualTo: model.appUser.email)
                      .getDocuments()
                      .then((snap) {
                    uid = snap.documents[0].documentID;
                  });

                  Firestore.instance.collection("guestVehicles").add({
                    "ownerName": name,
                    "entryTime": entryDate.toString(),
                    "exitTime": exitDate.toString(),
                    "isInside": isInside,
                    "numberPlate": numberPlate,
                    "hostSocietyRef": model.society.ref,
                    "hostUID": uid,
                    "type": type,
                  });
                  Navigator.pop(context);
                },
              );
            },
          ))
        ]),
      ),
    );
  }
}
