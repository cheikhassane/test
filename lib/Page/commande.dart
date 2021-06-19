//import 'dart:convert';
import 'package:dakar_cafe_express/Page/accueil.dart';
import 'package:dakar_cafe_express/Page/buttonWidget.dart';
import 'package:dakar_cafe_express/Page/cmdlog.dart';
//import 'package:dakar_cafe_express/Page/cmdlog.dart';
import 'package:dakar_cafe_express/Page/login.dart';
import 'package:flutter/material.dart';
//import 'dart:async';
//import 'package:http/http.dart' as http;
//import 'package:dakar_cafe_express/Page/bg.dart';

import 'mydrawer.dart';

class Commande extends StatefulWidget {
  final String userid;
  final String token;
  final String idp;
  final int sum;
  final int selectedCounter;
  final String nomP;
  final String subtitle;
  final String logoP;
  Commande(
      {this.idp,
      this.userid,
      this.token,
      this.sum,
      this.selectedCounter,
      this.nomP,
      this.subtitle,
      this.logoP});

  @override
  _CommandeState createState() => _CommandeState();
}

class _CommandeState extends State<Commande> {
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
                                  token: widget.token,
                                )));
                  },
                  child: Text("OK",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                )
              ]));
  // Future<dynamic> _sendCmd(int nbreCommande, int id) async {
  //   final http.Response response = await http.post(
  //     "https://dakarcafeexpress.com/dcx/public/index.php/api/commandes/ajout",
  //     headers: {
  //       //"Accept": "application/json",
  //       "content-Type": "application/json",
  //       "Authorization": "Bearer ${widget.token}"
  //     },
  //     body: jsonEncode(<dynamic, dynamic>{
  //       "nbreCommande": nbreCommande,
  //       "product": {"id": id}
  //     }),
  //   );
  //   debugPrint(response.body);
  //   var datauser = json.decode(response.body);

  //   print('Response status: ${response.statusCode}');
  //   print(nbreCommande);
  //   print(id);
  //   //final String token = datauser["token"];
  //   //final int userid = datauser['id'];
  //   //print('Token: ${token}');
  //   // data = datauser;
  //   //response.statusCode == 200
  //   if (response.statusCode != 201) {
  //     displayDialog(
  //         context, "Echec commande", "Veuillez réessayer une autre commande");
  //     // setState(() {
  //     //   msg = "Login Failed";
  //     // });
  //   } else if (response.statusCode == 201) {
  //     print("commande envoyer");
  //     displayDialog(context, "Votre commande a été prise en compte",
  //         "Appuyer sur OK pour faire une autre commande");
  //     // Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => new Accueil()));
  //   }
  //   // setState(() {

  //   //   level = datauser[0]['level'];
  //   // });

  //   return datauser;
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 35,
          backgroundColor: Colors.black87,
          elevation: 0,
          title: Text("Commande"),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        endDrawer: Drawer(
          child: Mydrawer(),
          elevation: 10,
        ),
        body: SafeArea(child: LayoutBuilder(
          builder: (context, contraints) {
            return contraints.maxWidth < 450 && contraints.maxWidth < 1200
                ? Column(
                    children: [
                      Container(
                        //height: size.height,
                        //width: size.width,
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        //width: size.width,

                        child: Image(
                          image: AssetImage("assets/accueil.jpeg"),
                          fit: BoxFit.cover,
                          // alignment: Alignment.bottomCenter,
                        ),
                        //color: themeData.primaryColor,
                      ),
                      Container(
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Text(
                                "Votre Café sur Dakar à porté de clic !",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              Spacer(
                                  //flex: 3,
                                  ),
                              Text(
                                "Appeler au 772471414",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              Spacer(
                                flex: 3,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 0.3,
                            ),
                          ),
                          //color: Colors.white,
                          height: 160,
                          //width: 350,
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
                                leading:
                                    Image(image: NetworkImage(widget.logoP)),
                                // subtitle: Text("${widget.subtitle}",
                                //     style: TextStyle(
                                //         color: Colors.black,
                                //         fontSize: 12,
                                //         fontWeight: FontWeight.bold)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "Nombre: ${widget.selectedCounter.toString()}",
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
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19),
                                    color: Colors.red.shade400),
                                child: Center(
                                  child: Text("Total: ${widget.sum.toString()}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      ButtonWidget(
                          text: 'Valider commande',
                          onClicked: () {
                            widget.token == null
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login(
                                              idp: widget.idp,
                                              userid: widget.userid,
                                              token: widget.token,
                                              sum: widget.sum,
                                              nomP: widget.nomP,
                                              subtitle: widget.subtitle,
                                              selectedCounter:
                                                  widget.selectedCounter,
                                              logoP: widget.logoP,
                                            )),
                                  )
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CmdLogin(
                                              idp: widget.idp,
                                              userid: widget.userid,
                                              token: widget.token,
                                              sum: widget.sum,
                                              nomP: widget.nomP,
                                              subtitle: widget.subtitle,
                                              selectedCounter:
                                                  widget.selectedCounter,
                                              logoP: widget.logoP,
                                            )),
                                  );
                          }),
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  )
                : contraints.maxWidth > 1000
                    ? Column(
                        children: [
                          Container(
                            //height: size.height,
                            //width: size.width,
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            //width: size.width,

                            child: Image(
                              image: AssetImage("assets/accueil.jpeg"),
                              fit: BoxFit.cover,
                              // alignment: Alignment.bottomCenter,
                            ),
                            //color: themeData.primaryColor,
                          ),
                          Container(
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Votre Café sur Dakar à porté de clic !",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  Spacer(
                                      //flex: 3,
                                      ),
                                  Text(
                                    "Appeler au 772471414",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  Spacer(
                                    flex: 3,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 0.3,
                                ),
                              ),
                              //color: Colors.white,
                              height: 160,
                              //width: 350,
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
                                    leading: Image(
                                        image: NetworkImage(widget.logoP)),
                                    // subtitle: Text("${widget.subtitle}",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontSize: 12,
                                    //         fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "Nombre: ${widget.selectedCounter.toString()}",
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
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        color: Colors.red.shade400),
                                    child: Center(
                                      child: Text(
                                          "Total: ${widget.sum.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ButtonWidget(
                              text: 'Valider commande',
                              onClicked: () {
                                widget.token == null
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login(
                                                  idp: widget.idp,
                                                  userid: widget.userid,
                                                  token: widget.token,
                                                  sum: widget.sum,
                                                  nomP: widget.nomP,
                                                  subtitle: widget.subtitle,
                                                  selectedCounter:
                                                      widget.selectedCounter,
                                                  logoP: widget.logoP,
                                                )),
                                      )
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CmdLogin(
                                                  idp: widget.idp,
                                                  userid: widget.userid,
                                                  token: widget.token,
                                                  sum: widget.sum,
                                                  nomP: widget.nomP,
                                                  subtitle: widget.subtitle,
                                                  selectedCounter:
                                                      widget.selectedCounter,
                                                  logoP: widget.logoP,
                                                )),
                                      );
                              }),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Container(
                              //height: size.height,
                              //width: size.width,
                              height: 350,
                              width: 270,
                              //width: size.width,

                              child: Image(
                                image: AssetImage("assets/accueil.jpeg"),
                                fit: BoxFit.cover,
                                // alignment: Alignment.bottomCenter,
                              ),
                              //color: themeData.primaryColor,
                            ),
                          ),
                          // Container(
                          //   height: 100,
                          //   color: Colors.red.shade700,
                          //   //color: Colors.deepOrange[700],
                          //   child: Center(
                          //     child: Column(
                          //       children: [
                          //         Spacer(),
                          //         Text(
                          //           "Dakar Café Express",
                          //           style: TextStyle(
                          //               fontSize: 18,
                          //               fontWeight: FontWeight.bold,
                          //               color: Colors.white),
                          //         ),
                          //         Spacer(),
                          //         Text(
                          //           "Votre Café sur Dakar à porté de clic !",
                          //           style: TextStyle(
                          //               fontSize: 12, color: Colors.white),
                          //         ),
                          //         Spacer(
                          //             //flex: 3,
                          //             ),
                          //         Text(
                          //           "Appeler au 772471414",
                          //           style: TextStyle(
                          //               fontSize: 12, color: Colors.white),
                          //         ),
                          //         Spacer(
                          //           flex: 3,
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 0.3,
                                ),
                              ),
                              //color: Colors.white,
                              height: 160,
                              //width: 350,
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
                                    leading: Image(
                                        image: NetworkImage(widget.logoP)),
                                    // subtitle: Text("${widget.subtitle}",
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontSize: 12,
                                    //         fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "Nombre: ${widget.selectedCounter.toString()}",
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
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        color: Colors.red.shade400),
                                    child: Center(
                                      child: Text(
                                          "Total: ${widget.sum.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          ButtonWidget(
                              text: 'Valider commande',
                              onClicked: () {
                                widget.token == null
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login(
                                                  idp: widget.idp,
                                                  userid: widget.userid,
                                                  token: widget.token,
                                                  sum: widget.sum,
                                                  nomP: widget.nomP,
                                                  subtitle: widget.subtitle,
                                                  selectedCounter:
                                                      widget.selectedCounter,
                                                  logoP: widget.logoP,
                                                )),
                                      )
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CmdLogin(
                                                  idp: widget.idp,
                                                  userid: widget.userid,
                                                  token: widget.token,
                                                  sum: widget.sum,
                                                  nomP: widget.nomP,
                                                  subtitle: widget.subtitle,
                                                  selectedCounter:
                                                      widget.selectedCounter,
                                                  logoP: widget.logoP,
                                                )),
                                      );
                              }),
                        ],
                      );
          },
        )),
      ),
    );
  }
}
