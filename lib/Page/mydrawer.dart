import 'package:dakar_cafe_express/Page/accueil.dart';
import 'package:dakar_cafe_express/Page/adduser.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  final String userid;
  final String nameuser;
  Mydrawer({this.userid, this.nameuser});
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    final nameuser = widget.userid;
    return new ListView(
      children: [
        new UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.black54),
          accountName: nameuser == null ? null : Text(nameuser),
          accountEmail: Text(""),
          currentAccountPicture: new CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image(
              image: AssetImage("assets/logoa1.png"),
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
            //Text("A"),
          ),
        ),
        // ListTile(
        //   title: Text("Connexion"),
        //   trailing: Icon(Icons.person),
        //   onTap: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Login()));
        //   },
        // ),
        ListTile(
          //tileColor: Colors.red.shade700,
          title: nameuser == null
              ? Text("Créer compte",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))
              : Text("",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Adduser()));
          },
        ),
        ListTile(
          title: nameuser == null
              ? Text("Connexion",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))
              : Text("Deconnexion",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Accueil()));
          },
        ),
      ],
    );
  }
}
