import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../widgets/drawer.dart';

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
          TextFormField(
            decoration: InputDecoration(
                labelText: "Guest Vehical Number",
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
          Center(
            child: RaisedButton(
              child: Text("Add Guest"),
              onPressed: () {
                if (!guestVehicleKey.currentState.validate()) {
                  return;
                }
                guestVehicleKey.currentState.save();

                Navigator.pop(context);
              },
            ),
          )
        ]),
      ),
    );
  }
}
