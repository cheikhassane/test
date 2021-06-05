import 'package:dakar_cafe_express/Page/adduser.dart';
import 'package:dakar_cafe_express/Page/login.dart';
import 'package:flutter/material.dart';

class Compte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un nouveau compte"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image(
                image: AssetImage("assets/Icone-.png"),
                height: 100,
                width: 100),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Container(
                  child: Text("Connexion"),
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Adduser()));
              },
              child: Container(
                child: Text("Créer un compte"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
