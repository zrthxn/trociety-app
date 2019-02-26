import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class VehicleLog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
    );
  }
}