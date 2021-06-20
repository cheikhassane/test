import 'dart:convert';
import 'package:dakar_cafe_express/Page/accueil.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Adduser extends StatefulWidget {
  @override
  _AdduserState createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ph = new TextEditingController();
  final TextEditingController firt = new TextEditingController();
  final TextEditingController last = new TextEditingController();
  final TextEditingController addr = new TextEditingController();
  final TextEditingController pass = new TextEditingController();

  String username = '';
  String level = '';

  void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(text),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                )
              ]));

  Future<dynamic> _addUser(String phone, String firstName, String lastName,
      String adresse, String password) async {
    final http.Response response = await http.post(
      "https://dakarcafeexpress.com/dcx/public/index.php/users/ajout",
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
          context, MaterialPageRoute(builder: (context) => new Accueil()));
    } else {
      displayDialog(context, "An error Occured",
          "No account was found matching that username and password");
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Créer un compte",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black87,
          actions: [
            Image(
              image: AssetImage("assets/logoa1.png"),
              height: 80,
              width: 80,
            ),
          ],
          centerTitle: true),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    //color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: ph,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Téléphone',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre Téléphone';
                      }
                      return null;
                    },
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
                    controller: firt,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Prénom ',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre prénom';
                      }
                      return null;
                    },
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
                    //color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: last,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Nom ',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre nom';
                      }
                      return null;
                    },
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
                    //color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: addr,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Adresse ',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre adresse';
                      }
                      return null;
                    },
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
                    //color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: pass,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Mot de Passe ',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre mot de passe';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
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
                    if (_formKey.currentState.validate()) {
                      _addUser(
                          ph.text, firt.text, last.text, addr.text, pass.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Accueil()));
                    }
                  }),
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
