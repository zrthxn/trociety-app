import 'package:flutter/material.dart';

class Vehicle {
  final String numberPlate;
  final String carName;
  final String id;
  bool status;
  final String type;
  final String model;
  final String color;
  Vehicle(
      {@required this.id,
      @required this.carName,
      @required this.type,
      @required this.numberPlate,
      @required this.model,
      @required this.color});
}
