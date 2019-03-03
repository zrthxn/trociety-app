import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';

class CarCard extends StatelessWidget {
  String name;
  String number;
  String type="car";
  bool isInside;
  CarCard(
      {@required this.name,
      @required this.number,
      @required this.type,
      @required this.isInside});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print("In  Card");
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.15,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name.toString(),
                maxLines: 1,
                textAlign: TextAlign.left,
                textScaleFactor: 2.0,
              ),
              Text(
                number.toString(),
                textAlign: TextAlign.left,
                textScaleFactor: 1.3,
              )
            ],
          ),
          SizedBox(
            width: screenWidth * 0.07,
          ),
          Icon(
            type.toLowerCase() == "car"
                ? Icons.directions_car
                : Icons.directions_bike,
            size: 30,
          ),
          SizedBox(
            width: screenWidth * 0.08,
          ),
          Text(
            "Vehicle Status : ",
            textScaleFactor: 1.1,
          ),
          Icon(
            Icons.fiber_manual_record,
            color: isInside ? Colors.green : Colors.red,
          )
        ],
      ),
    );
  }
}
