import 'dart:convert';
import 'package:dakar_cafe_express/Page/adduser.dart';
import 'package:dakar_cafe_express/Page/buttonWidget.dart';
import 'package:dakar_cafe_express/Page/cmdlog.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

//import 'mydrawer.dart';

class Login extends StatefulWidget {
  //final int iduser;
  final String token;
  final String userid;
  //final String token;
  final String idp;
  final int sum;
  final int selectedCounter;
  final String nomP;
  final String subtitle;
  final String logoP;

  Login(
      {this.idp,
      this.userid,
      this.token,
      this.sum,
      this.selectedCounter,
      this.nomP,
      this.subtitle,
      this.logoP});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Future<Users> _futureGet;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController user = new TextEditingController();
  final TextEditingController pass = new TextEditingController();
  String msg = '';
  //int userid;
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
  Future<dynamic> _sendUser(String username, String password) async {
    final http.Response response = await http.post(
      "https://dakarcafeexpress.com/dcx/public/index.php/api/login_check",
      headers: <String, String>{
        //"Accept": "application/json",
        "content-Type": "application/json",
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    debugPrint(response.body);
    var datauser = json.decode(response.body);
    print('Response status: ${response.statusCode}');
    final String token = datauser["token"];
    //final String message = datauser["message"];
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    //print(decodedToken);
    //print(message);
    final String userid = decodedToken['username'];
    //print('Token: ${token}');
    // data = datauser;
    //response.statusCode == 200
    if (response.statusCode == 401) {
      //print("username or password no correct");
      displayDialog(context, "Vérifier votre saisie",
          "Nom utilisateur ou mot de passe incorrect");
      //   if (response.statusCode == 401) {
      //   displayDialog(context, "Vérifier votre saisie",
      //       "Nom utilisateur ou mot de passe incorrect");
      // setState(() {
      //   msg = "username or password no correct";
      // });
      // }
    } else if (response.statusCode == 200) {
      print("Welcome admin");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new CmdLogin(
                    token: token,
                    userid: userid,
                    idp: widget.idp,
                    sum: widget.sum,
                    nomP: widget.nomP,
                    subtitle: widget.subtitle,
                    selectedCounter: widget.selectedCounter,
                    logoP: widget.logoP,
                  )));
    } else {
      displayDialog(context, "Vérifier votre saisie",
          "Nom utilisateur ou mot de passe incorrect");
    }
    // setState(() {

    //   level = datauser[0]['level'];
    // });

    return datauser;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   //_sendUser();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //       "Login",
      //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //     ),
      //     centerTitle: true),
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.black87,
        title: Text(
          "Connexion",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      //drawer: new Drawer(child: Mydrawer()),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(
              //   flex: 20,
              // ),
              SizedBox(
                height: 50,
              ),
              // Container(
              //   margin: EdgeInsets.all(30),
              //   child: Text(
              //     'Saisir votre numéro de téléphone et votre mot de passe ou créer un compte',
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 19,
              //         color: Colors.black),
              //   ),
              // ),
              // Spacer(
              //   flex: 5,
              // ),
              Image(
                image: AssetImage("assets/logoa.png"),
                height: 200,
                width: 200,
              ),
              // SizedBox(
              //   height: 100,
              // ),
              //Spacer(flex: 2),
              // Icon(
              //   Icons.login,
              //   size: size.height * 0.07,
              // ),
              // SizedBox(
              //   height: size.height * 0.05,
              // ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: user,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.white,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre Téléphone';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Téléphone',
                      labelText: 'Numéro de téléphone',
                      labelStyle: TextStyle(color: Colors.black),
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
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
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: pass,
                    cursorColor: Colors.white,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre mot de passe';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Mot de passe ',
                      labelText: 'Votre mot de passe',
                      labelStyle: TextStyle(color: Colors.black),
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                        //Theme.of(context).primaryColor,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Colors.white38,
                      ),
                      //border: InputBorder.none
                    ),
                  ),
                ),
              ),

              // SizedBox(
              //   height: size.height * 0.5,
              // ),
              // RaisedButton(
              //     child: Text("Login"),
              //     onPressed: () {
              //       _sendUser();
              //     }),
              ButtonWidget(
                  text: 'Login',
                  onClicked: () {
                    if (_formKey.currentState.validate()) {
                      _sendUser(user.text, pass.text);
                    }
                  }),
              SizedBox(
                height: 30,
              ),
              Text(
                msg,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.red),
              ),
              // Spacer(
              //   flex: 3,
              // ),
              // Text(
              //   msg,
              //   style: TextStyle(
              //       fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red),
              // )
              ButtonWidget(
                  text: "Créer un compte",
                  onClicked: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Adduser()))),
              // Spacer(
              //   flex: 4,
              // ),
            ],
          ),
        ),
      ),
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
