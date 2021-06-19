import 'package:dakar_cafe_express/Page/accueil.dart';
//import 'package:dakar_cafe_express/Page/background.dart';
//import 'package:dakar_cafe_express/Page/test.dart';
//import 'package:dakar_cafe_express/Page/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

//import 'mydrawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _currentIndex = 0;

  // Widget callPage(int currentIndex) {
  //   switch (_currentIndex) {
  //     case 0:
  //       return Accueil();
  //     case 1:
  //       return Login();
  //       break;
  //     default:
  //   }
  //   return callPage(currentIndex);
  // }

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
                      Colors.red.shade700,
                      Colors.red.shade500,
                      Colors.red.shade300
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
                    image: Image(image: AssetImage("assets/logoa.png")),
                    //backgroundColor: Background(Color: Colors.white,),
                    loaderColor: Colors.white,
                  )
                : contraints.maxWidth > 1000
                    ? new SplashScreen(
                        gradientBackground: LinearGradient(colors: [
                          Colors.red.shade700,
                          Colors.red.shade500,
                          Colors.red.shade300
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
                        image: Image(image: AssetImage("assets/logoa.png")),
                        //backgroundColor: Background(Color: Colors.white,),
                        loaderColor: Colors.white,
                      )
                    : new SplashScreen(
                        gradientBackground: LinearGradient(colors: [
                          Colors.red.shade700,
                          Colors.red.shade500,
                          Colors.red.shade300
                        ]),
                        photoSize: 100.0,
                        seconds: 7,
                        navigateAfterSeconds: new Accueil(),
                        title: new Text(
                          'Bienvenue chez Dakar Café Express',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white),
                        ),
                        image: Image(image: AssetImage("assets/logoa.png")),
                        //backgroundColor: Background(Color: Colors.white,),
                        loaderColor: Colors.white,
                      );
          },
        ))
        //Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 35,
        //   backgroundColor: Colors.transparent,
        // ),
        // drawer: new Drawer(child: Mydrawer()),
        // body: callPage(_currentIndex),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //         // ignore: deprecated_member_use
        //         title: Text("Home"),
        //         backgroundColor: Colors.white),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.person),
        //         // ignore: deprecated_member_use
        //         title: Text("Compte"),
        //         backgroundColor: Colors.white),
        //   ],
        //   onTap: (value) {
        //     setState(() {
        //       _currentIndex = value;
        //     });
        //   },
        // ),
        //),
        );
  }
}

// CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               floating: false,
//               expandedHeight: 300,
//               flexibleSpace: FlexibleSpaceBar(
//                 titlePadding: EdgeInsets.only(left: 20),
//                 title: Text(
//                   widget.title,
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 background: Image.asset(
//                   "assets/Icone-.png",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               //backgroundColor: Colors.black,
//               elevation: 10,
//             ),

//           ],
//         ),
