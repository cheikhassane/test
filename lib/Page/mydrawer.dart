import 'package:dakar_cafe_express/Page/accueil.dart';
import 'package:dakar_cafe_express/Page/adduser.dart';
//import 'package:dakar_cafe_express/Page/login.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  final String userid;
  Mydrawer({this.userid});
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
          accountName: nameuser == null ? null : Text(nameuser),
          accountEmail: Text(""),
          currentAccountPicture: new CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image(
              image: AssetImage("assets/logoa.png"),
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
          title: Text("Créer compte"),
          trailing: Icon(Icons.add),
          onTap: () {
            // Navigator.of(context).pop();
            // Scaffold.of(context).showSnackBar(new SnackBar(
            //   content: new Text("you click me "),
            //   duration: new Duration(seconds: 4),
            // ));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Adduser()));
          },
        ),
        ListTile(
          title: nameuser == null ? Text("Connexion") : Text("Deconnexion"),
          trailing: Icon(Icons.outbox),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Accueil()));
          },
        ),
      ],
    );
  }
}
