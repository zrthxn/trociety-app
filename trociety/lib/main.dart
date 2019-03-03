import 'package:flutter/material.dart';
import './pages/welcome_page.dart';
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
          primaryColor: Color.fromRGBO(0, 81, 255, 1),
          accentColor: Color.fromRGBO(0, 81, 255, 1),
        ),
        title: "Trociety",
        //home: SocietySelectorPage(),
        routes: {
          "/": (BuildContext context)=>WelcomePage(),
          "/auth" : (BuildContext context)=>AuthPage(),
        },
      ),
    );
  }
}
