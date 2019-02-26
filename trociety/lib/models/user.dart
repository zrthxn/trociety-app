import './vehicle.dart';
import './guestVehicle.dart';
import 'package:flutter/material.dart';

class User {
  final String uid;
  final String houseNo;
  final String email;
  final List<Vehicle> houseCars;
  final List<GuestVehicle> guestCars;

  User(
      {@required this.uid,
      @required this.email,
      @required this.houseNo,
      @required this.houseCars,
      this.guestCars});
}
