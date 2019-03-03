import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import './home_page.dart';

class LoggingInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 1,
        loadingText: Text("Logging you in"),
        
        navigateAfterSeconds: HomePage());
  }
}
