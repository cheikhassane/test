import 'package:dakar_cafe_express/Page/accueil.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: LayoutBuilder(
          builder: (context, contraints) {
            return contraints.maxWidth < 450 && contraints.maxWidth < 1200
                ? new SplashScreen(
                    gradientBackground: LinearGradient(colors: [
                      Colors.red.shade900,
                      Colors.red.shade500,
                      Colors.red.shade800
                    ]),
                    photoSize: 200.0,
                    seconds: 7,
                    navigateAfterSeconds: new Accueil(),
                    title: new Text(
                      'Bienvenue chez Dakar Café Express',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                    image: Image(image: AssetImage("assets/logoD.png")),
                    loaderColor: Colors.white,
                  )
                : contraints.maxWidth > 1000
                    ? new SplashScreen(
                        gradientBackground: LinearGradient(colors: [
                          Colors.red.shade900,
                          Colors.red.shade600,
                          Colors.red.shade800
                        ]),
                        photoSize: 200.0,
                        seconds: 7,
                        navigateAfterSeconds: new Accueil(),
                        title: new Text(
                          'Bienvenue chez Dakar Café Express',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                        image: Image(image: AssetImage("assets/logoD.png")),
                        loaderColor: Colors.white,
                      )
                    : new SplashScreen(
                        gradientBackground: LinearGradient(colors: [
                          Colors.red.shade900,
                          Colors.red.shade600,
                          Colors.red.shade800
                        ]),
                        photoSize: 80.0,
                        seconds: 7,
                        navigateAfterSeconds: new Accueil(),
                        title: new Text(
                          'Bienvenue chez Dakar Café Express',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white),
                        ),
                        image: Image(
                          image: AssetImage("assets/logoD.png"),
                        ),
                        loaderColor: Colors.white,
                      );
          },
        )));
  }
}
