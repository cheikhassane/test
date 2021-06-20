import 'dart:convert';
import 'package:dakar_cafe_express/Page/adduser.dart';
import 'package:dakar_cafe_express/Page/buttonWidget.dart';
import 'package:dakar_cafe_express/Page/cmdlog.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

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

    var datauser = json.decode(response.body);

    final String token = datauser["token"];

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    final String userid = decodedToken['username'];

    if (response.statusCode == 401) {
      displayDialog(context, "Vérifier votre saisie",
          "Nom utilisateur ou mot de passe incorrect");
    } else if (response.statusCode == 200) {
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

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.black87,
        title: Text(
          "Connexion",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
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

              Image(
                image: AssetImage("assets/logoa1.png"),
                height: 200,
                width: 200,
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

              ButtonWidget(
                  text: 'Connexion',
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

              ButtonWidget(
                  text: "Créer un compte",
                  onClicked: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Adduser()))),
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
