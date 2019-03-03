import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class ShowInfo extends StatelessWidget {
  String name;
  String email;
  String contact;
  String numberPlate;

  ShowInfo({this.name, this.email, this.contact, this.numberPlate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar( 
        title: Text("Info",textAlign: TextAlign.center,),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Vehicle Owner Information ",
              textScaleFactor: 1.7,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Name :- $name",
              textScaleFactor: 1.1,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Email :- $email",
              textScaleFactor: 1.1,
            ),
          ),  
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Contact :- $contact",
              textScaleFactor: 1.1,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Text(
              "NumberPlate :- $numberPlate",
              textScaleFactor: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
