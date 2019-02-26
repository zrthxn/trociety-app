import 'package:flutter/material.dart';

import './pages/society_selector_page.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped_model/main.dart';
import './pages/auth_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.red,
        ),
        title: "Trociety",
        //home: SocietySelectorPage(),
        routes: {
          "/": (BuildContext context)=>SocietySelectorPage(),
          "/auth" : (BuildContext context)=>AuthPage(),
        },
      ),
    );
  }
}
