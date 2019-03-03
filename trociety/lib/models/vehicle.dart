import 'package:flutter/material.dart';

class Vehicle {
  String numberPlate;
  String carName;
  bool isInside;
  String type;
  Vehicle({
    @required this.carName,
    @required this.type,
    @required this.numberPlate,
    @required this.isInside,
  });
}
