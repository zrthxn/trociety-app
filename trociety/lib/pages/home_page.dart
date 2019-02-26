import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import './edit_vehicles_page.dart';
import '../widgets/vehicle_card.dart';
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          return Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return EditVehiclesPage();
          }));
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
      body: ListView(
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
          CarCard(),
          CarCard(),
        ],
      ),
    );
  }
}
