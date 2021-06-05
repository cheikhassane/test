import 'dart:convert';

// import 'package:projecttest/PageOne.dart';
//import 'package:dakar_cafe_express/Page/pagecafe.dart';
//import 'package:dakar_cafe_express/Page/commande.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
// import 'package:projecttest/PageTwo.dart';
//import 'package:projecttest/buttonWidget.dart';
import 'package:dakar_cafe_express/Page/login.dart';

//https://67fd26fc2225.ngrok.io/users/ajout

// {

//         "phone": "776007070",
//         "firstName": "dudu",
//         "lastName": "ndiaye",
//         "adresse": "km",
//         "password":"user"
//     }

// import 'dart:convert';
class Adduser extends StatefulWidget {
  @override
  _AdduserState createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  // Future<Users> _futureGet;
  final TextEditingController ph = new TextEditingController();
  final TextEditingController firt = new TextEditingController();
  final TextEditingController last = new TextEditingController();
  final TextEditingController addr = new TextEditingController();
  final TextEditingController pass = new TextEditingController();

  String username = '';
  String level = '';
  // List data = [];

  void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(text),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => PageOne()));
                  },
                  child: Text("OK",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                )
              ]));
  // "http://localhost:3003/collecte3/"
  // http://10.0.2.2:3003/collecte3/"
  Future<dynamic> _addUser(String phone, String firstName, String lastName,
      String adresse, String password) async {
    final http.Response response = await http.post(
      "https://dakarcafeexpress.com/dakarkj8/public/index.php/users/ajout",
      headers: <String, String>{
        //   "Accept": "application/json; charset=UTF-8",
        "content-Type": "application/json",
      },
      body: jsonEncode(<String, String>{
        "phone": phone,
        "firstName": firstName,
        "lastName": lastName,
        "adresse": adresse,
        "password": password
      }),
    );

    debugPrint(response.body);
    var datauser = json.decode(response.body);
    // data = datauser;
    if (response.statusCode == 201) {
      print("Welcome new user");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => new Login()));
    } else {
      displayDialog(context, "An error Occured",
          "No account was found matching that username and password");
      // setState(() {
      //   msg = "Login Failed";
      // });
    }

    // if (datauser.length == 0) {
    //   displayDialog(context, "An error Occured",
    //       "No account was found matching that username and password");
    //   // setState(() {
    //   //   msg = "Adduser Failed";
    //   // });
    // } else if (datauser[0]['level'] == 'admin') {
    //   print("Welcome admin");
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => new PageOne(
    //                 username: username,
    //                 level: level,
    //               )));
    // } else if (datauser[0]['level'] == 'member') {
    //   print("Welcome member");
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => PageTwo(
    //                 username: username,
    //                 level: level,
    //               )));
    // }
    // setState(() {
    //   username = datauser[0]['username'];
    //   level = datauser[0]['level'];
    // });
    // if (response.body == "row") {
    //   debugPrint(response.body);

    //   //  return Users.fromJson(json.decode(response.body.toString()));
    // } else if (response.body == "Aucun resultat trouver") {
    //   displayDialog(context, "An error Occured",
    //       "No account was found matching that username and password");
    // }
    return datauser;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _addUser();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Créer un compte",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
          actions: [
            Image(
              image: AssetImage("assets/logoa.png"),
              height: 80,
              width: 80,
            ),
          ],
          centerTitle: true),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Créer un compte',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // Image(
              //   image: AssetImage("assets/logoa.png"),
              //   height: 80,
              //   width: 80,
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // Icon(
              //   Icons.login,
              //   size: size.height * 0.07,
              // ),
              SizedBox(
                height: size.height * 0.15,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: ph,
                    decoration: InputDecoration(
                      hintText: 'Télephone',
                      // icon: Icon(
                      //   Icons.person,
                      //   color: Theme.of(context).primaryColor,
                      // ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: firt,
                    //cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Prénom ',
                      // icon: Icon(
                      //   Icons.lock,
                      //   color: Theme.of(context).primaryColor,
                      // ),
                      //border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: last,
                    //cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Nom ',
                      // icon: Icon(
                      //   Icons.,
                      //   color: Theme.of(context).primaryColor,
                      // ),
                      //border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: addr,
                    //cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Adresse ',
                      // icon: Icon(
                      //   Icons.home,
                      //   color: Theme.of(context).primaryColor,
                      // ),
                      //border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    controller: pass,
                    //cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Mot de Passe ',
                      icon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                      ),
                      //border: InputBorder.none
                    ),
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //   margin: EdgeInsets.symmetric(vertical: 10),
              //   width: size.width * 0.8,
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).primaryColor,
              //     borderRadius: BorderRadius.circular(29),
              //   ),
              //   child: TextField(
              //     controller: lev,
              //     cursorColor: Colors.black,
              //     decoration: InputDecoration(
              //       hintText: 'level ',
              //       icon: Icon(
              //         Icons.lock,
              //         color: Theme.of(context).primaryColor,
              //       ),
              //       //border: InputBorder.none
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: size.height * 0.5,
              // ),
              RaisedButton(
                  color: Colors.black,
                  child: Text(
                    "Créer un compte",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    _addUser(
                        ph.text, firt.text, last.text, addr.text, pass.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }),
              //ButtonWidget(text: 'Adduser', onClicked: () => _addUser()),

              // Text(
              //   msg,
              //   style: TextStyle(
              //       fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red),
              // )
            ],
          ),
        ),
      ),
      // body: Form(
      //     child: (_futureGet)
      //         ? Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text(
      //                 "Connexion",
      //                 style:
      //                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(height: size.height * 0.05),
      //               Container(
      //                 margin: EdgeInsets.symmetric(vertical: 10),
      //                 padding:
      //                     EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //                 width: size.width * 0.8,
      //                 decoration: BoxDecoration(
      //                     color: Colors.amberAccent,
      //                     borderRadius: BorderRadius.circular(29)),
      //                 child: TextField(
      //                   controller: _textControllerUser,
      //                   cursorColor: Colors.amber,
      //                   decoration: InputDecoration(
      //                     icon: Icon(
      //                       Icons.person,
      //                       color: Colors.amber,
      //                     ),
      //                     hintText: "username",
      //                     border: InputBorder.none,
      //                   ),
      //                 ),
      //               ),
      //               Container(
      //                 margin: EdgeInsets.symmetric(vertical: 10),
      //                 padding:
      //                     EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //                 width: size.width * 0.8,
      //                 decoration: BoxDecoration(
      //                     color: Colors.amberAccent,
      //                     borderRadius: BorderRadius.circular(29)),
      //                 child: TextField(
      //                   controller: _textControllerPass,
      //                   cursorColor: Colors.amber,
      //                   decoration: InputDecoration(
      //                     icon: Icon(
      //                       Icons.person,
      //                       color: Colors.amber,
      //                     ),
      //                     hintText: "password",
      //                     border: InputBorder.none,
      //                   ),
      //                 ),
      //               ),
      //               Container(
      //                 margin: EdgeInsets.symmetric(vertical: 10),
      //                 width: size.width * 0.8,
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(29),
      //                   child: FlatButton(
      //                       padding: EdgeInsets.symmetric(
      //                           vertical: 20, horizontal: 40),
      //                       color: Colors.amberAccent,
      //                       onPressed: () {
      //                         setState(() {
      //                           _futureGet = _sendUser(_textControllerUser.text,
      //                               _textControllerPass.text);
      //                         });
      //                       },
      //                       child: Text(
      //                         "Conexion",
      //                         style: TextStyle(color: Colors.black),
      //                       )),
      //                 ),
      //               ),
      //             ],
      //           )
      //         : FutureBuilder(
      //             future: _futureGet,
      //             builder: (context, snapshot) {
      //               if (snapshot.hasData) {
      //                 return PageOne();
      //               } else if (snapshot.hasError) {
      //                 return Text("${snapshot.error}");
      //               } else
      //                 CircularProgressIndicator();
      //             })),
    );
  }
}

class Users {
  final String username;
  final String password;

  Users({this.username, this.password});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(username: json['username'], password: json['password']);
  }
}
