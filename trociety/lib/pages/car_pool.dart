import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_model/main.dart';
import '../widgets/drawer.dart';
import 'package:intl/intl.dart';

class CarPool extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
      body: ScopedModelDescendant<MainModel>(builder: (BuildContext context,Widget child,MainModel model){
        return Container(
          
         
        );
      },),
    );
  }
}