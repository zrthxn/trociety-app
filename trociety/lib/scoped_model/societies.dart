import 'package:scoped_model/scoped_model.dart';
import '../models/society.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'dart:async';

mixin SocietiesModel on Model{
List<Society> societies;

  Widget fetchSocietyData (){
    var a = StreamBuilder(
      stream: Firestore.instance.collection("societies").snapshots(),
      builder: (BuildContext context,snapshot){
        if (!snapshot.hasData) {
          print("loading");

        }
        else
          print(snapshot.data.toString());
      })
    ;
  }
  


}