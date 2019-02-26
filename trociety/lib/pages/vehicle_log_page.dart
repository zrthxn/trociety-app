import 'package:flutter/material.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import '../widgets/drawer.dart';

class VehicleLog extends StatefulWidget {
  @override
  VehicleLogState createState() {
    return new VehicleLogState();
  }
}

class VehicleLogState extends State<VehicleLog> {
  List<String> array=["ASDASDAS","DASDASD"];

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  //   @override
  //   void initState() {
  //     super.initState();
  //     _firebaseMessaging
  //         .requestNotificationPermissions(const IosNotificationSettings(
  //       sound: true,
  //       alert: true,
  //       badge: true,
  //     ));
  //     _firebaseMessaging.onIosSettingsRegistered
  //         .listen((IosNotificationSettings settings) {
  //       print("IOS WORKING");
  //     });
  //     _firebaseMessaging.configure(onLaunch: (Map<String, dynamic> message) {
  //       print(message);
  //     }, onMessage: (Map<String, dynamic> message) {
  //       print(message);
  //     }, onResume: (Map<String, dynamic> message) {
  //       print(message);
  //     });
  //     _firebaseMessaging.getToken().then((token) {
  //       print(token); //decide id like
  //       array.add(token);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: array.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(array[index]);
        },
      ),
    );
  }
}
