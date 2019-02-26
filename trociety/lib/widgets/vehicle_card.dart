import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth =MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      
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
                "Car Name",
                textAlign: TextAlign.left,
                textScaleFactor: 2.0,
              ),
              Text(
                "DLXXXXXXXX",
                textAlign: TextAlign.left,
                textScaleFactor: 1.3,
              )
            ],
          ),
          SizedBox(width: screenWidth * 0.07 ,),
          Icon(Icons.directions_car,size: 30,),
          SizedBox(width: screenWidth * 0.08 ,),
          Text("Vehicle Status : ",textScaleFactor: 1.1,),
          Icon(
            Icons.fiber_manual_record,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
