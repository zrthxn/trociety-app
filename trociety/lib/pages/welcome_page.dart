import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './society_selector_page.dart';
//TO BE BUILT
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.blue[100],
      seconds: 3,
      loadingText: Text("Loading.."),
      title: Text(
        "Trociety",
      textScaleFactor: 1.2,),
      loaderColor: Colors.white,
      navigateAfterSeconds: SocietySelectorPage(),
    );
  }
}
