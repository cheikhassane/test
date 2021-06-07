import 'dart:convert';
import 'package:dakar_cafe_express/Page/accueil.dart';
import 'package:dakar_cafe_express/Page/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dakar_cafe_express/Page/bg.dart';

import 'mydrawer.dart';

class CmdLogin extends StatefulWidget {
  final String userid;
  final String token;
  final String idp;
  final int sum;
  final int selectedCounter;
  final String nomP;
  final String subtitle;
  CmdLogin(
      {this.idp,
      this.userid,
      this.token,
      this.sum,
      this.selectedCounter,
      this.nomP,
      this.subtitle});

  @override
  _CmdLoginState createState() => _CmdLoginState();
}

class _CmdLoginState extends State<CmdLogin> {
  final TextEditingController ncmd = new TextEditingController();
  final TextEditingController proid = new TextEditingController();

  void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(text),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new Accueil(
                                token: widget.token, userid: widget.userid)));
                  },
                  child: Text("OK",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                )
              ]));
  Future<dynamic> _sendCmd(int nbreCommande, int id) async {
    final http.Response response = await http.post(
      "https://dakarcafeexpress.com/dakarkj8/public/index.php/api/commandes/ajout",
      headers: {
        //"Accept": "application/json",
        "content-Type": "application/json",
        "Authorization": "Bearer ${widget.token}"
      },
      body: jsonEncode(<dynamic, dynamic>{
        "nbreCommande": nbreCommande,
        "product": {"id": id}
      }),
    );
    debugPrint(response.body);
    var datauser = json.decode(response.body);

    print('Response status: ${response.statusCode}');
    print(nbreCommande);
    print(id);
    //final String token = datauser["token"];
    //final int userid = datauser['id'];
    //print('Token: ${token}');
    // data = datauser;
    //response.statusCode == 200
    if (response.statusCode != 201) {
      displayDialog(
          context, "Echec commande", "Veuillez réessayer une autre commande");
      // setState(() {
      //   msg = "Login Failed";
      // });
    } else if (response.statusCode == 201) {
      print("commande envoyer");
      displayDialog(context, "Votre commande a été prise en compte",
          "Appuyer sur OK pour faire une autre commande");
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => new Accueil()));
    }
    // setState(() {

    //   level = datauser[0]['level'];
    // });

    return datauser;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
            child: Mydrawer(
          userid: widget.userid,
        )),
        body: Stack(
          children: [
            HomePageBackground(
                screenHeight: MediaQuery.of(context).size.height),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 650, left: 270),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: AssetImage("assets/logoa.png"),
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  height: 100,
                  color: Colors.red.shade700,
                  //color: Colors.deepOrange[700],
                  child: Center(
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          "Dakar Café Express",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Votre Café sur Dakar à porté de clic !",
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(
                            //flex: 3,
                            ),
                        Text(
                          "Appeler au 772471414",
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(
                          flex: 3,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 370, left: 40, right: 40),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Container(
                    color: Colors.white,
                    height: 150,
                    width: 350,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "${widget.nomP}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: Image(image: AssetImage("assets/logoa.png")),
                          subtitle: Text("Description: ${widget.subtitle}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Nombre: ${widget.selectedCounter.toString()}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: Colors.red.shade400),
                          child: Center(
                            child: Text("Total: ${widget.sum.toString()}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Card(
                  //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(19)),
                  //   color: Colors.white,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Nom produit: ${widget.nomP}",
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //       Text("Description: ${widget.subtitle}",
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.bold)),
                  //       Text("Nombre: ${widget.selectedCounter.toString()}",
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.bold)),
                  //       Text("Total: ${widget.sum.toString()}",
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.bold))
                  //     ],
                  //   ),
                  // ),
                  // Center(child: Text(widget.nomP)),
                  // Center(child: Text(widget.subtitle)),
                  // Center(child: Text(widget.sum.toString())),
                  // Center(child: Text(widget.selectedCounter.toString())),
                  //Center(child: Text("Bearer ${widget.token}")),
                  // Center(child: Text(widget.idp)),

                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  // RaisedButton(
                  //     child: Text("Login"),
                  //     onPressed: () {
                  //       _sendUser();
                  //     }),
                  ButtonWidget(
                      text: 'Valider Commande',
                      onClicked: () => _sendCmd(
                          widget.selectedCounter, int.parse(widget.idp))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
