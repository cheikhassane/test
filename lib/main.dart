import 'package:dakar_cafe_express/Page/accueil.dart';
import 'package:flutter/material.dart';
//import "Page/homepage.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Dakar Café Express',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Accueil(),
      //MyHomePage(title: 'Dakar Café Express'),
    );
  }
}
