import './vehicle.dart';
import './guestVehicle.dart';
import 'package:flutter/material.dart';

class User {
  String houseNo;
  String email;
  String name;
  String contactNumber;
  List<Vehicle> houseCars = [];
  List<GuestVehicle> guestCars = [];

  User(
      {@required this.email,
      @required this.name,
      @required this.contactNumber,
      @required this.houseNo,
      @required this.houseCars,
      this.guestCars});
}
