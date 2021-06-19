import 'dart:ui';

import 'package:dakar_cafe_express/Page/accesoire.dart';
import 'package:dakar_cafe_express/Page/machine.dart';
import 'package:dakar_cafe_express/Page/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'detailcmd.dart';

class Accueil extends StatefulWidget {
  final String logoP;
  final String nomP;
  final String priceP;
  final String subtitle;
  final String userid;
  final String idp;
  final String token;
  final String category;
  //final String nameuser;
  Accueil({
    this.userid,
    this.logoP,
    this.nomP,
    this.priceP,
    this.subtitle,
    this.idp,
    this.token,
    this.category,
    //this.nameuser
  });

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final String url =
      "https://dakarcafeexpress.com/dcx/public/index.php/products";

  List data = [];

  Future<dynamic> getProduct() async {
    http.Response response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var convertData = json.decode(response.body);
    data = convertData;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(size);

    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          backgroundColor: Colors.black87,
          actions: [
            Image(
              image: AssetImage("assets/logoa.png"),
            ),
          ],
        ),
        drawer: new Drawer(
            child: Mydrawer(
          userid: widget.userid,
        )),
        body: new SafeArea(child: LayoutBuilder(
          builder: (context, contraints) {
            return contraints.maxWidth < 450 && contraints.maxWidth < 1200
                ? Column(
                    children: [
                      Container(
                        //height: size.height,
                        //width: size.width,
                        height: 150,
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
                      Container(
                        height: 90,
                        color: Colors.red.shade900,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Spacer(),
                            Container(
                                child: Column(children: [
                              Image(
                                image: AssetImage("assets/Capsule.png"),
                                height: 60,
                                width: 60,
                              ),
                              Text(
                                "Capsules",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ])),
                            Spacer(
                              flex: 3,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Machine(
                                              userid: widget.userid,
                                              token: widget.token,
                                            )));
                              },
                              child: Container(
                                  child: Column(children: [
                                Image(
                                  image: AssetImage(
                                    "assets/machine.png",
                                  ),
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Machines",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ])),
                            ),
                            Spacer(
                              flex: 3,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Accessoire(
                                              userid: widget.userid,
                                              token: widget.token,
                                            )));
                              },
                              child: Container(
                                  child: Column(children: [
                                Image(
                                  image: AssetImage("assets/tasse.png"),
                                  height: 60,
                                  width: 60,
                                ),
                                Text(
                                  "Accessoires",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ])),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 300,
                          //width: 400,
                          //color: Theme.of(context).primaryColor,
                          child: FutureBuilder(
                              future: getProduct(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data == 0
                                        ? null
                                        : snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      final logoP =
                                          "${snapshot.data[index]["image"]}";
                                      final nomP =
                                          "${snapshot.data[index]["libelle"]}";
                                      final idp =
                                          "${snapshot.data[index]["id"]}";
                                      final priceP =
                                          "${snapshot.data[index]["price"]}";
                                      final category =
                                          "${snapshot.data[index]["category"]}";
                                      final subtitle =
                                          "${snapshot.data[index]["description"]}";
                                      if (category == "A") {
                                        return Card(
                                          elevation: 30,
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Detailcmd(
                                                            logoP: logoP,
                                                            nomP: nomP,
                                                            priceP: priceP,
                                                            subtitle: subtitle,
                                                            idp: idp,
                                                            userid: widget
                                                                .userid
                                                                .toString(),
                                                            token: widget.token,
                                                          )));
                                            },
                                            leading: Image(
                                              //image: AssetImage("assets/logoa.png"),
                                              image: NetworkImage(
                                                  "${snapshot.data[index]["image"]}"),
                                              fit: BoxFit.cover,
                                              height: 50,
                                              width: 50,
                                            ),
                                            title: Text(
                                              "${snapshot.data[index]["libelle"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              //"${widget.token}",
                                              "${snapshot.data[index]["description"]}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                //fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            trailing: Text(
                                              "${snapshot.data[index]["price"].toString()}F",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Text(
                                          "",
                                          style: TextStyle(fontSize: 0),
                                        );
                                      }
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                      "Veuillez vérifier si votre portable est connecté");
                                }
                                return Center(
                                    child: CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(Colors.red),
                                ));
                              }),
                        ),
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
                          Container(
                            height: 90,
                            color: Colors.red.shade900,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Spacer(),
                                Container(
                                    child: Column(children: [
                                  Image(
                                    image: AssetImage("assets/Capsule.png"),
                                    height: 60,
                                    width: 60,
                                  ),
                                  Text(
                                    "Capsules",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ])),
                                Spacer(
                                  flex: 3,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Machine(
                                                  userid: widget.userid,
                                                  token: widget.token,
                                                )));
                                  },
                                  child: Container(
                                      child: Column(children: [
                                    Image(
                                      image: AssetImage(
                                        "assets/machine.png",
                                      ),
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text(
                                      "Machines",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ])),
                                ),
                                Spacer(
                                  flex: 3,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Accessoire(
                                                  userid: widget.userid,
                                                  token: widget.token,
                                                )));
                                  },
                                  child: Container(
                                      child: Column(children: [
                                    Image(
                                      image: AssetImage("assets/tasse.png"),
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text(
                                      "Accessoires",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ])),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 300,
                              //width: 400,
                              //color: Theme.of(context).primaryColor,
                              child: FutureBuilder(
                                  future: getProduct(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                        itemCount: snapshot.data == 0
                                            ? null
                                            : snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          final logoP =
                                              "${snapshot.data[index]["image"]}";
                                          final nomP =
                                              "${snapshot.data[index]["libelle"]}";
                                          final idp =
                                              "${snapshot.data[index]["id"]}";
                                          final priceP =
                                              "${snapshot.data[index]["price"]}";
                                          final category =
                                              "${snapshot.data[index]["category"]}";
                                          final subtitle =
                                              "${snapshot.data[index]["description"]}";
                                          if (category == "A") {
                                            return Card(
                                              elevation: 30,
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: ListTile(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Detailcmd(
                                                                logoP: logoP,
                                                                nomP: nomP,
                                                                priceP: priceP,
                                                                subtitle:
                                                                    subtitle,
                                                                idp: idp,
                                                                userid: widget
                                                                    .userid
                                                                    .toString(),
                                                                token: widget
                                                                    .token,
                                                              )));
                                                },
                                                leading: Image(
                                                  //image: AssetImage("assets/logoa.png"),
                                                  image: NetworkImage(
                                                      "${snapshot.data[index]["image"]}"),
                                                  fit: BoxFit.cover,
                                                  height: 50,
                                                  width: 50,
                                                ),
                                                title: Text(
                                                  "${snapshot.data[index]["libelle"]}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  //"${widget.token}",
                                                  "${snapshot.data[index]["description"]}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    //fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                trailing: Text(
                                                  "${snapshot.data[index]["price"].toString()}F",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Text(
                                              "",
                                              style: TextStyle(fontSize: 0),
                                            );
                                          }
                                        },
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          "Veuillez vérifier si votre portable est connecté");
                                    }
                                    return Center(
                                        child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.red),
                                    ));
                                  }),
                            ),
                          ),
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

                              child: Image(
                                image: AssetImage("assets/accueil.jpeg"),
                                fit: BoxFit.cover,
                                // alignment: Alignment.bottomCenter,
                              ),
                              //color: themeData.primaryColor,
                            ),
                          ),
                          Container(
                            height: 400,
                            color: Colors.red.shade900,
                            //color: Colors.deepOrange[900],
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.end,
                              verticalDirection: VerticalDirection.up,
                              children: [
                                Spacer(),
                                Container(
                                    child: Column(children: [
                                  Image(
                                    image: AssetImage("assets/Capsule.png"),
                                    height: 60,
                                    width: 60,
                                  ),
                                  Text(
                                    "Capsules",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ])),
                                Spacer(
                                  flex: 3,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Machine(
                                                  userid: widget.userid,
                                                  token: widget.token,
                                                )));
                                  },
                                  child: Container(
                                      child: Column(children: [
                                    Image(
                                      image: AssetImage(
                                        "assets/machine.png",
                                      ),
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text(
                                      "Machines",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ])),
                                ),
                                Spacer(
                                  flex: 3,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Accessoire(
                                                  userid: widget.userid,
                                                  token: widget.token,
                                                )));
                                  },
                                  child: Container(
                                      child: Column(children: [
                                    Image(
                                      image: AssetImage("assets/tasse.png"),
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text(
                                      "Accessoires",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ])),
                                ),
                                // Spacer(
                                //   flex: 5,
                                // ),
                              ],
                            ),
                          ),
                          Column(
                            verticalDirection: VerticalDirection.up,
                            children: [
                              Expanded(
                                child: Container(
                                  //height: 500,
                                  width: 450,
                                  //color: Theme.of(context).primaryColor,
                                  child: FutureBuilder(
                                      future: getProduct(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return ListView.builder(
                                            itemCount: snapshot.data == 0
                                                ? null
                                                : snapshot.data.length,
                                            itemBuilder: (context, index) {
                                              final logoP =
                                                  "${snapshot.data[index]["image"]}";
                                              final nomP =
                                                  "${snapshot.data[index]["libelle"]}";
                                              final idp =
                                                  "${snapshot.data[index]["id"]}";
                                              final priceP =
                                                  "${snapshot.data[index]["price"]}";
                                              final category =
                                                  "${snapshot.data[index]["category"]}";
                                              final subtitle =
                                                  "${snapshot.data[index]["description"]}";
                                              if (category == "A") {
                                                return Card(
                                                  elevation: 30,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: ListTile(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Detailcmd(
                                                                        logoP:
                                                                            logoP,
                                                                        nomP:
                                                                            nomP,
                                                                        priceP:
                                                                            priceP,
                                                                        subtitle:
                                                                            subtitle,
                                                                        idp:
                                                                            idp,
                                                                        userid: widget
                                                                            .userid
                                                                            .toString(),
                                                                        token: widget
                                                                            .token,
                                                                      )));
                                                    },
                                                    leading: Image(
                                                      //image: AssetImage("assets/logoa.png"),
                                                      image: NetworkImage(
                                                          "${snapshot.data[index]["image"]}"),
                                                      fit: BoxFit.cover,
                                                      height: 50,
                                                      width: 50,
                                                    ),
                                                    title: Text(
                                                      "${snapshot.data[index]["libelle"]}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    subtitle: Text(
                                                      //"${widget.token}",
                                                      "${snapshot.data[index]["description"]}",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        //fontWeight: FontWeight.bold
                                                      ),
                                                    ),
                                                    trailing: Text(
                                                      "${snapshot.data[index]["price"].toString()}F",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Text(
                                                  "",
                                                  style: TextStyle(fontSize: 0),
                                                );
                                              }
                                            },
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text(
                                              "Veuillez vérifier si votre portable est connecté");
                                        }
                                        return Center(
                                            child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.red),
                                        ));
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
          },
        )),

        // Stack(
        //   children: [
        //     Container(
        //       child: isMobiles(context) == true
        //           ? Container(
        //               //height: size.height,
        //               //width: size.width,
        //               height: 280,
        //               width: size.width,

        //               child: Image(
        //                 image: AssetImage("assets/accueil.jpeg"),
        //                 fit: BoxFit.cover,
        //                 // alignment: Alignment.bottomCenter,
        //               ),
        //               //color: themeData.primaryColor,
        //             )
        //           : isMobile(context) == true
        //               ? Container(
        //                   //height: size.height,
        //                   //width: size.width,
        //                   height: 180,
        //                   width: size.width,

        //                   child: Image(
        //                     image: AssetImage("assets/accueil.jpeg"),
        //                     fit: BoxFit.cover,
        //                     // alignment: Alignment.bottomCenter,
        //                   ),
        //                   //color: themeData.primaryColor,
        //                 )
        //               : isTablet(context) != true
        //                   ? Container(
        //                       //height: size.height,
        //                       //width: size.width,
        //                       height: 560,
        //                       width: size.width,

        //                       child: Image(
        //                         image: AssetImage("assets/accueil.jpeg"),
        //                         fit: BoxFit.cover,
        //                         // alignment: Alignment.bottomCenter,
        //                       ),
        //                       //color: themeData.primaryColor,
        //                     )
        //                   : Container(
        //                       //height: size.height,
        //                       //width: size.width,
        //                       height: 360,
        //                       width: size.width,

        //                       child: Image(
        //                         image: AssetImage("assets/accueil.jpeg"),
        //                         fit: BoxFit.cover,
        //                         // alignment: Alignment.bottomCenter,
        //                       ),
        //                       //color: themeData.primaryColor,
        //                     ),
        //     ),
        //     // HomePageBackground(
        //     //     screenHeight: MediaQuery.of(context).size.height),
        //     Center(
        //       child: isMobiles(context) == true
        //           ? Padding(
        //               padding: const EdgeInsets.only(bottom: 650, left: 270),
        //               child: ClipRRect(
        //                 borderRadius: BorderRadius.circular(50),
        //                 child: Image(
        //                   image: AssetImage("assets/logoa.png"),
        //                   fit: BoxFit.cover,
        //                   height: 100,
        //                   width: 100,
        //                 ),
        //               ),
        //             )
        //           : isMobile(context) == true
        //               ? Padding(
        //                   padding:
        //                       const EdgeInsets.only(bottom: 450, left: 270),
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(50),
        //                     child: Image(
        //                       image: AssetImage("assets/logoa.png"),
        //                       fit: BoxFit.cover,
        //                       height: 100,
        //                       width: 100,
        //                     ),
        //                   ),
        //                 )
        //               : isTablet(context) == true
        //                   ? Padding(
        //                       padding:
        //                           const EdgeInsets.only(bottom: 750, left: 670),
        //                       child: ClipRRect(
        //                         borderRadius: BorderRadius.circular(50),
        //                         child: Image(
        //                           image: AssetImage("assets/logoa.png"),
        //                           fit: BoxFit.cover,
        //                           height: 100,
        //                           width: 100,
        //                         ),
        //                       ),
        //                     )
        //                   : Padding(
        //                       padding:
        //                           const EdgeInsets.only(bottom: 850, left: 770),
        //                       child: ClipRRect(
        //                         borderRadius: BorderRadius.circular(50),
        //                         child: Image(
        //                           image: AssetImage("assets/logoa.png"),
        //                           fit: BoxFit.cover,
        //                           height: 100,
        //                           width: 100,
        //                         ),
        //                       ),
        //                     ), // Padding(
        //     ),
        //     //
        //     Center(
        //       child: Padding(
        //         padding: const EdgeInsets.only(bottom: 162),
        //         child: Container(
        //           height: 100,
        //           color: Colors.red.shade700,
        //           //color: Colors.deepOrange[700],
        //           child: Center(
        //             child: Column(
        //               children: [
        //                 Spacer(),
        //                 Text(
        //                   "Dakar Café Express",
        //                   style: TextStyle(
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.bold,
        //                       color: Colors.white),
        //                 ),
        //                 Spacer(),
        //                 Text(
        //                   "Votre Café sur Dakar à porté de clic !",
        //                   style: TextStyle(fontSize: 12, color: Colors.white),
        //                 ),
        //                 Spacer(
        //                     //flex: 3,
        //                     ),
        //                 Text(
        //                   "Appeler au 772471414",
        //                   style: TextStyle(fontSize: 12, color: Colors.white),
        //                 ),
        //                 Spacer(
        //                   flex: 3,
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Center(
        //       child: Padding(
        //         padding: const EdgeInsets.only(bottom: 0, top: 20),
        //         child: Container(
        //           height: 90,
        //           color: Colors.red.shade900,
        //           //color: Colors.deepOrange[900],
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             children: [
        //               Spacer(),
        //               Container(
        //                   child: Column(children: [
        //                 Image(
        //                   image: AssetImage("assets/Capsule.png"),
        //                   height: 60,
        //                   width: 60,
        //                 ),
        //                 Text(
        //                   "Capsules",
        //                   style: TextStyle(
        //                       fontSize: 15,
        //                       fontWeight: FontWeight.bold,
        //                       color: Colors.white),
        //                 ),
        //               ])),
        //               Spacer(
        //                 flex: 3,
        //               ),
        //               InkWell(
        //                 onTap: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => Machine(
        //                                 userid: widget.userid,
        //                                 token: widget.token,
        //                               )));
        //                 },
        //                 child: Container(
        //                     child: Column(children: [
        //                   Image(
        //                     image: AssetImage(
        //                       "assets/machine.png",
        //                     ),
        //                     height: 60,
        //                     width: 60,
        //                   ),
        //                   Text(
        //                     "Machines",
        //                     style: TextStyle(
        //                         fontSize: 15,
        //                         fontWeight: FontWeight.bold,
        //                         color: Colors.white),
        //                   ),
        //                 ])),
        //               ),
        //               Spacer(
        //                 flex: 3,
        //               ),
        //               InkWell(
        //                 onTap: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => Accessoire(
        //                               userid: widget.userid,
        //                               token: widget.token)));
        //                 },
        //                 child: Container(
        //                     child: Column(children: [
        //                   Image(
        //                     image: AssetImage("assets/tasse.png"),
        //                     height: 60,
        //                     width: 60,
        //                   ),
        //                   Text(
        //                     "Accessoires",
        //                     style: TextStyle(
        //                         fontSize: 15,
        //                         fontWeight: FontWeight.bold,
        //                         color: Colors.white),
        //                   ),
        //                 ])),
        //               ),
        //               Spacer(),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     Center(
        //       child: isMobiles(context) == true
        //           ? Padding(
        //               padding: const EdgeInsets.only(
        //                 top: 410,
        //               ),
        //               child: Container(
        //                 height: 300,
        //                 //width: 400,
        //                 //color: Theme.of(context).primaryColor,
        //                 child: FutureBuilder(
        //                     future: getProduct(),
        //                     builder: (context, snapshot) {
        //                       if (snapshot.hasData) {
        //                         return ListView.builder(
        //                           itemCount: snapshot.data == 0
        //                               ? null
        //                               : snapshot.data.length,
        //                           itemBuilder: (context, index) {
        //                             final logoP =
        //                                 "${snapshot.data[index]["image"]}";
        //                             final nomP =
        //                                 "${snapshot.data[index]["libelle"]}";
        //                             final idp = "${snapshot.data[index]["id"]}";
        //                             final priceP =
        //                                 "${snapshot.data[index]["price"]}";
        //                             final category =
        //                                 "${snapshot.data[index]["category"]}";
        //                             final subtitle =
        //                                 "${snapshot.data[index]["description"]}";
        //                             if (category == "A") {
        //                               return Card(
        //                                 elevation: 30,
        //                                 color: Colors.white,
        //                                 shape: RoundedRectangleBorder(
        //                                     borderRadius:
        //                                         BorderRadius.circular(20)),
        //                                 child: ListTile(
        //                                   onTap: () {
        //                                     Navigator.push(
        //                                         context,
        //                                         MaterialPageRoute(
        //                                             builder: (context) =>
        //                                                 Detailcmd(
        //                                                   logoP: logoP,
        //                                                   nomP: nomP,
        //                                                   priceP: priceP,
        //                                                   subtitle: subtitle,
        //                                                   idp: idp,
        //                                                   userid: widget.userid
        //                                                       .toString(),
        //                                                   token: widget.token,
        //                                                 )));
        //                                   },
        //                                   leading: Image(
        //                                     //image: AssetImage("assets/logoa.png"),
        //                                     image: NetworkImage(
        //                                         "${snapshot.data[index]["image"]}"),
        //                                     fit: BoxFit.cover,
        //                                     height: 50,
        //                                     width: 50,
        //                                   ),
        //                                   title: Text(
        //                                     "${snapshot.data[index]["libelle"]}",
        //                                     style: TextStyle(
        //                                         color: Colors.black,
        //                                         fontSize: 15,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                   subtitle: Text(
        //                                     //"${widget.token}",
        //                                     "${snapshot.data[index]["description"]}",
        //                                     style: TextStyle(
        //                                       color: Colors.black,
        //                                       fontSize: 12,
        //                                       //fontWeight: FontWeight.bold
        //                                     ),
        //                                   ),
        //                                   trailing: Text(
        //                                     "${snapshot.data[index]["price"].toString()}F",
        //                                     style: TextStyle(
        //                                         color: Colors.black,
        //                                         fontSize: 14,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ),
        //                               );
        //                             } else {
        //                               return Text(
        //                                 "",
        //                                 style: TextStyle(fontSize: 0),
        //                               );
        //                             }
        //                           },
        //                         );
        //                       } else if (snapshot.hasError) {
        //                         return Text(
        //                             "Veuillez vérifier si votre portable est connecté");
        //                       }
        //                       return Center(
        //                           child: CircularProgressIndicator(
        //                         valueColor:
        //                             AlwaysStoppedAnimation<Color>(Colors.red),
        //                       ));
        //                     }),
        //               ),
        //             )
        //           : isMobile(context) == true
        //               ? Padding(
        //                   padding: const EdgeInsets.only(
        //                     top: 370,
        //                   ),
        //                   child: Container(
        //                     height: 400,
        //                     //width: 400,
        //                     //color: Theme.of(context).primaryColor,
        //                     child: FutureBuilder(
        //                         future: getProduct(),
        //                         builder: (context, snapshot) {
        //                           if (snapshot.hasData) {
        //                             return ListView.builder(
        //                               itemCount: snapshot.data == 0
        //                                   ? null
        //                                   : snapshot.data.length,
        //                               itemBuilder: (context, index) {
        //                                 final logoP =
        //                                     "${snapshot.data[index]["image"]}";
        //                                 final nomP =
        //                                     "${snapshot.data[index]["libelle"]}";
        //                                 final idp =
        //                                     "${snapshot.data[index]["id"]}";
        //                                 final priceP =
        //                                     "${snapshot.data[index]["price"]}";
        //                                 final category =
        //                                     "${snapshot.data[index]["category"]}";
        //                                 final subtitle =
        //                                     "${snapshot.data[index]["description"]}";
        //                                 if (category == "A") {
        //                                   return Card(
        //                                     elevation: 30,
        //                                     color: Colors.white,
        //                                     shape: RoundedRectangleBorder(
        //                                         borderRadius:
        //                                             BorderRadius.circular(20)),
        //                                     child: ListTile(
        //                                       onTap: () {
        //                                         Navigator.push(
        //                                             context,
        //                                             MaterialPageRoute(
        //                                                 builder: (context) =>
        //                                                     Detailcmd(
        //                                                       logoP: logoP,
        //                                                       nomP: nomP,
        //                                                       priceP: priceP,
        //                                                       subtitle:
        //                                                           subtitle,
        //                                                       idp: idp,
        //                                                       userid: widget
        //                                                           .userid
        //                                                           .toString(),
        //                                                       token:
        //                                                           widget.token,
        //                                                     )));
        //                                       },
        //                                       leading: Image(
        //                                         //image: AssetImage("assets/logoa.png"),
        //                                         image: NetworkImage(
        //                                             "${snapshot.data[index]["image"]}"),
        //                                         fit: BoxFit.cover,
        //                                         height: 50,
        //                                         width: 50,
        //                                       ),
        //                                       title: Text(
        //                                         "${snapshot.data[index]["libelle"]}",
        //                                         style: TextStyle(
        //                                             color: Colors.black,
        //                                             fontSize: 15,
        //                                             fontWeight:
        //                                                 FontWeight.bold),
        //                                       ),
        //                                       subtitle: Text(
        //                                         //"${widget.token}",
        //                                         "${snapshot.data[index]["description"]}",
        //                                         style: TextStyle(
        //                                           color: Colors.black,
        //                                           fontSize: 12,
        //                                           //fontWeight: FontWeight.bold
        //                                         ),
        //                                       ),
        //                                       trailing: Text(
        //                                         "${snapshot.data[index]["price"].toString()}F",
        //                                         style: TextStyle(
        //                                             color: Colors.black,
        //                                             fontSize: 14,
        //                                             fontWeight:
        //                                                 FontWeight.bold),
        //                                       ),
        //                                     ),
        //                                   );
        //                                 } else {
        //                                   return Text(
        //                                     "",
        //                                     style: TextStyle(fontSize: 0),
        //                                   );
        //                                 }
        //                               },
        //                             );
        //                           } else if (snapshot.hasError) {
        //                             return Text(
        //                                 "Veuillez vérifier si votre portable est connecté");
        //                           }
        //                           return Center(
        //                               child: CircularProgressIndicator(
        //                             valueColor: AlwaysStoppedAnimation<Color>(
        //                                 Colors.red),
        //                           ));
        //                         }),
        //                   ),
        //                 )
        //               : isTablet(context) == true
        //                   ? Padding(
        //                       padding: const EdgeInsets.only(
        //                         top: 510,
        //                       ),
        //                       child: Container(
        //                         height: 400,
        //                         //width: 400,
        //                         //color: Theme.of(context).primaryColor,
        //                         child: FutureBuilder(
        //                             future: getProduct(),
        //                             builder: (context, snapshot) {
        //                               if (snapshot.hasData) {
        //                                 return ListView.builder(
        //                                   itemCount: snapshot.data == 0
        //                                       ? null
        //                                       : snapshot.data.length,
        //                                   itemBuilder: (context, index) {
        //                                     final logoP =
        //                                         "${snapshot.data[index]["image"]}";
        //                                     final nomP =
        //                                         "${snapshot.data[index]["libelle"]}";
        //                                     final idp =
        //                                         "${snapshot.data[index]["id"]}";
        //                                     final priceP =
        //                                         "${snapshot.data[index]["price"]}";
        //                                     final category =
        //                                         "${snapshot.data[index]["category"]}";
        //                                     final subtitle =
        //                                         "${snapshot.data[index]["description"]}";
        //                                     if (category == "A") {
        //                                       return Card(
        //                                         elevation: 30,
        //                                         color: Colors.white,
        //                                         shape: RoundedRectangleBorder(
        //                                             borderRadius:
        //                                                 BorderRadius.circular(
        //                                                     20)),
        //                                         child: ListTile(
        //                                           onTap: () {
        //                                             Navigator.push(
        //                                                 context,
        //                                                 MaterialPageRoute(
        //                                                     builder:
        //                                                         (context) =>
        //                                                             Detailcmd(
        //                                                               logoP:
        //                                                                   logoP,
        //                                                               nomP:
        //                                                                   nomP,
        //                                                               priceP:
        //                                                                   priceP,
        //                                                               subtitle:
        //                                                                   subtitle,
        //                                                               idp: idp,
        //                                                               userid: widget
        //                                                                   .userid
        //                                                                   .toString(),
        //                                                               token: widget
        //                                                                   .token,
        //                                                             )));
        //                                           },
        //                                           leading: Image(
        //                                             //image: AssetImage("assets/logoa.png"),
        //                                             image: NetworkImage(
        //                                                 "${snapshot.data[index]["image"]}"),
        //                                             fit: BoxFit.cover,
        //                                             height: 50,
        //                                             width: 50,
        //                                           ),
        //                                           title: Text(
        //                                             "${snapshot.data[index]["libelle"]}",
        //                                             style: TextStyle(
        //                                                 color: Colors.black,
        //                                                 fontSize: 15,
        //                                                 fontWeight:
        //                                                     FontWeight.bold),
        //                                           ),
        //                                           subtitle: Text(
        //                                             //"${widget.token}",
        //                                             "${snapshot.data[index]["description"]}",
        //                                             style: TextStyle(
        //                                               color: Colors.black,
        //                                               fontSize: 12,
        //                                               //fontWeight: FontWeight.bold
        //                                             ),
        //                                           ),
        //                                           trailing: Text(
        //                                             "${snapshot.data[index]["price"].toString()}F",
        //                                             style: TextStyle(
        //                                                 color: Colors.black,
        //                                                 fontSize: 14,
        //                                                 fontWeight:
        //                                                     FontWeight.bold),
        //                                           ),
        //                                         ),
        //                                       );
        //                                     } else {
        //                                       return Text(
        //                                         "",
        //                                         style: TextStyle(fontSize: 0),
        //                                       );
        //                                     }
        //                                   },
        //                                 );
        //                               } else if (snapshot.hasError) {
        //                                 return Text(
        //                                     "Veuillez vérifier si votre portable est connecté");
        //                               }
        //                               return Center(
        //                                   child: CircularProgressIndicator(
        //                                 valueColor:
        //                                     AlwaysStoppedAnimation<Color>(
        //                                         Colors.red),
        //                               ));
        //                             }),
        //                       ),
        //                     )
        //                   : Padding(
        //                       padding: const EdgeInsets.only(
        //                         top: 600,
        //                       ),
        //                       child: Container(
        //                         height: 500,
        //                         //width: 400,
        //                         //color: Theme.of(context).primaryColor,
        //                         child: FutureBuilder(
        //                             future: getProduct(),
        //                             builder: (context, snapshot) {
        //                               if (snapshot.hasData) {
        //                                 return ListView.builder(
        //                                   itemCount: snapshot.data == 0
        //                                       ? null
        //                                       : snapshot.data.length,
        //                                   itemBuilder: (context, index) {
        //                                     final logoP =
        //                                         "${snapshot.data[index]["image"]}";
        //                                     final nomP =
        //                                         "${snapshot.data[index]["libelle"]}";
        //                                     final idp =
        //                                         "${snapshot.data[index]["id"]}";
        //                                     final priceP =
        //                                         "${snapshot.data[index]["price"]}";
        //                                     final category =
        //                                         "${snapshot.data[index]["category"]}";
        //                                     final subtitle =
        //                                         "${snapshot.data[index]["description"]}";
        //                                     if (category == "A") {
        //                                       return Card(
        //                                         elevation: 30,
        //                                         color: Colors.white,
        //                                         shape: RoundedRectangleBorder(
        //                                             borderRadius:
        //                                                 BorderRadius.circular(
        //                                                     20)),
        //                                         child: ListTile(
        //                                           onTap: () {
        //                                             Navigator.push(
        //                                                 context,
        //                                                 MaterialPageRoute(
        //                                                     builder:
        //                                                         (context) =>
        //                                                             Detailcmd(
        //                                                               logoP:
        //                                                                   logoP,
        //                                                               nomP:
        //                                                                   nomP,
        //                                                               priceP:
        //                                                                   priceP,
        //                                                               subtitle:
        //                                                                   subtitle,
        //                                                               idp: idp,
        //                                                               userid: widget
        //                                                                   .userid
        //                                                                   .toString(),
        //                                                               token: widget
        //                                                                   .token,
        //                                                             )));
        //                                           },
        //                                           leading: Image(
        //                                             //image: AssetImage("assets/logoa.png"),
        //                                             image: NetworkImage(
        //                                                 "${snapshot.data[index]["image"]}"),
        //                                             fit: BoxFit.cover,
        //                                             height: 50,
        //                                             width: 50,
        //                                           ),
        //                                           title: Text(
        //                                             "${snapshot.data[index]["libelle"]}",
        //                                             style: TextStyle(
        //                                                 color: Colors.black,
        //                                                 fontSize: 15,
        //                                                 fontWeight:
        //                                                     FontWeight.bold),
        //                                           ),
        //                                           subtitle: Text(
        //                                             //"${widget.token}",
        //                                             "${snapshot.data[index]["description"]}",
        //                                             style: TextStyle(
        //                                               color: Colors.black,
        //                                               fontSize: 12,
        //                                               //fontWeight: FontWeight.bold
        //                                             ),
        //                                           ),
        //                                           trailing: Text(
        //                                             "${snapshot.data[index]["price"].toString()}F",
        //                                             style: TextStyle(
        //                                                 color: Colors.black,
        //                                                 fontSize: 14,
        //                                                 fontWeight:
        //                                                     FontWeight.bold),
        //                                           ),
        //                                         ),
        //                                       );
        //                                     } else {
        //                                       return Text(
        //                                         "",
        //                                         style: TextStyle(fontSize: 0),
        //                                       );
        //                                     }
        //                                   },
        //                                 );
        //                               } else if (snapshot.hasError) {
        //                                 return Text(
        //                                     "Veuillez vérifier si votre portable est connecté");
        //                               }
        //                               return Center(
        //                                   child: CircularProgressIndicator(
        //                                 valueColor:
        //                                     AlwaysStoppedAnimation<Color>(
        //                                         Colors.red),
        //                               ));
        //                             }),
        //                       ),
        //                     ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
