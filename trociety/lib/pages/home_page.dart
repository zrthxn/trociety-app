import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import './edit_vehicles_page.dart';
import '../widgets/vehicle_card.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  String token;

  @override
  Widget build(BuildContext context) {
    print("REACHING HOME");
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return AddVehiclesPage();
                },
              ),
            );
          },
        ),
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            "Trociety",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Your Vehicles",
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,
              ),
            ),
            ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
                print(model.listVehicle.length);
                print("HOME REACHING SCOPED");

                return model.listVehicle.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: model.listVehicle.length,
                          itemBuilder: (BuildContext context, int index) =>
                              CarCard(
                                name: model.listVehicle[index].carName,
                                number: model.listVehicle[index].numberPlate,
                                type: model.listVehicle[index].type,
                                isInside: model.listVehicle[index].isInside,
                              ),
                        ),
                      )
                    : Center(
                        heightFactor: 30.0,
                        child: Text("Empty"),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
