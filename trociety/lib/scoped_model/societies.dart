import 'package:scoped_model/scoped_model.dart';
import '../models/society.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dart:async';

mixin SocietiesModel on Model {
  Society society;

  void initSocietyData ({String sid,String ref}){
    society =Society(ref: ref,sid: sid);

  }

}
