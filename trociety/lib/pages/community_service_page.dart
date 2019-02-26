import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class CommunityService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(),
    );
  }
}