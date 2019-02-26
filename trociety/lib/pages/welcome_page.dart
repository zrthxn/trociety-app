import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './home_page.dart';
//TO BE BUILT
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.blue[100],
      seconds: 3,
      photoSize: 125.0,
      title: Text(
        "Trociety",
      ),
      navigateAfterSeconds: HomePage(),
    );
  }
}
