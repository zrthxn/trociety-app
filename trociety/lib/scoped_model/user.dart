import '../models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/vehicle.dart';
import 'package:flutter/material.dart';
import '../models/guestVehicle.dart';

mixin UserModel on Model {
  User appUser;
  List<Vehicle> listVehicle = [];
  List<GuestVehicle> guestListVehicle = [];

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    notifyListeners();
    return googleSignInAccount;
  }

  void initAppUser({
    @required String email,
    @required String contactNo,
    @required String name,
    @required List<Vehicle> houseCar,
    @required List<GuestVehicle> guestCars,
    @required String houseNo,
  }) {
    appUser = User(
      email: email,
      name: name,
      contactNumber: contactNo,
      houseCars: houseCar,
      guestCars: guestCars,
      houseNo: houseNo,
    );
    notifyListeners();
  }

  Future<Null> updateData(String email, String ref) {
    print("Firebase 1");
    Firestore.instance
        .collection("users")
        .document(ref)
        .collection("residents")
        .where("email", isEqualTo: email.toLowerCase())
        .getDocuments()
        .then(
      (userSnapshot) {
        //print(userSnapshot.documents[0].data);
        Map<String, dynamic> a = userSnapshot.documents[0].data;
        //Get user vehicles
        print("Firebase 2");
        Firestore.instance
            .collection("vehicles")
            .where("ownerUID", isEqualTo: a["uid"])
            .getDocuments()
            .then(
          (vehicleSnapshot) {
            //print(vehicleSnapshot.documents[0].data);
            if (vehicleSnapshot.documents.isNotEmpty)
              vehicleSnapshot.documents.forEach(
                (item) {
                  Vehicle ad = new Vehicle(
                      carName: item.data["carName"],
                      isInside: item.data["isInside"],
                      numberPlate: item.data["numberPlate"],
                      type: item.data["type"]);

                  listVehicle.add(ad);
                },
              );
          },
        );

        //Get user Guestvehicles
        Firestore.instance
            .collection("guestVehicles")
            .where("hostUID", isEqualTo: a["uid"])
            .getDocuments()
            .then(
          (guestVehicleSnapshot) {
            //print(guestVehicleSnapshot.documents[0].data);
            if (guestVehicleSnapshot.documents.isNotEmpty)
              guestVehicleSnapshot.documents.forEach(
                (item) {
                  GuestVehicle asd = new GuestVehicle(
                      ownerName: item.data["ownerName"],
                      incoming:
                          DateTime.parse(item.data['entryTime'].toString()),
                      outgoing:
                          DateTime.parse(item.data['exitTime'].toString()),
                      isInside: item.data["isInside"],
                      numberPlate: item.data["numberPlate"],
                      type: item.data["type"]);

                  guestListVehicle.add(asd);
                },
              );
          },
        );
        print("REACHING INIT APP CALL");
        initAppUser(
          contactNo: a["contactNumber"],
          email: email,
          name: a["name"],
          houseNo: a["address"],
          houseCar: listVehicle,
          guestCars: guestListVehicle,
        );
      },
    );
    notifyListeners();
  }

  void updateCars() {
   
  }

  Future<Null> signOut() async {
    appUser = null ;
    listVehicle = null;
    guestListVehicle = null;
    
    await googleSignIn.signOut();
    notifyListeners();
  }
}
