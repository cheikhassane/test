//import 'package:dakar_cafe_express/Page/background.dart';
import 'package:flutter/material.dart';

//import 'accueil.dart';
//import 'adduser.dart';
import 'commande.dart';
//import 'mydrawer.dart';
// import 'package:jaayma_mburu/valid_command.dart';
// import 'package:jaayma_mburu/constants2.dart';

class Detailcmd extends StatefulWidget {
  final String logoP;
  final String nomP;
  final String priceP;
  final String subtitle;
  final String idp;
  final String idpro;
  final String userid;
  final String token;
  final String nameuser;
  // final int sum;
  // final int selectedCounter;
  Detailcmd({
    this.logoP,
    this.nomP,
    this.priceP,
    this.subtitle,
    this.idp,
    this.idpro,
    this.userid,
    this.token,
    this.nameuser,
    //this.sum,
    //this.selectedCounter
  });
  @override
  _DetailcmdState createState() => _DetailcmdState();
}

class _DetailcmdState extends State<Detailcmd> {
  int sumPrice = 0;
  int sum = 0;
  int selectedCounter = 0;
  List user = [];
  // String productId = "";
  // String idBoul = "";

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

  void sumPriceadd() {
    setState(() {
      sum = selectedCounter * int.parse(widget.priceP);
    });
  }

  void sumPriceRm() {
    setState(() {
      sum = sum - int.parse(widget.priceP);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Dakar Café Express",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [Image(image: AssetImage("assets/logoa1.png"))],
      ),
      body: new SafeArea(
        child: LayoutBuilder(
          builder: (context, contraints) {
            return contraints.maxWidth < 450
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Hero(
                            tag: "cafe",
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(widget.logoP),
                                ),
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 16, right: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.nomP,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                widget.subtitle,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 38,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedCounter--;
                                            sumPriceRm();
                                            // if (selectedCounter < 1) {
                                            //   print("under 1 blocking");
                                            // } else {
                                            //   selectedCounter--;
                                            //   sumPriceRm();
                                            //   //user.remove(user);
                                            // }
                                          });
                                        },
                                        child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          selectedCounter.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            // if (selectedCounter >= 1) {
                                            //   // print("under 1 blocking");
                                            //   selectedCounter++;
                                            //   sumPriceadd();
                                            // } else {
                                            //   print("under 1 blocking");
                                            //   // selectedCounter++;
                                            //   // sumPriceadd();
                                            //   //user.remove(user);
                                            // }
                                            selectedCounter++;
                                            sumPriceadd();
                                            //user.add(user);
                                          });
                                        },
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Total : $sum F",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 3,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: <Widget>[
                      //       //Padding(padding: EdgeInsets.only(right: 300.0)),
                      //       // Container(
                      //       //   padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                      //       //   child: Text(
                      //       //     "Description",
                      //       //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      //       //   ),
                      //       // ),
                      //       // SizedBox(
                      //       //   height: 8,
                      //       // ),
                      //       // SingleChildScrollView(
                      //       //   child: Container(
                      //       //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      //       //     height: 70,
                      //       //     decoration: BoxDecoration(
                      //       //       gradient: LinearGradient(
                      //       //         colors: [Colors.black, Colors.white.withOpacity(0.8)],
                      //       //         end: Alignment.center,
                      //       //         stops: [0.0, 0.5],
                      //       //       ),
                      //       //     ),
                      //       //     child: Text(
                      //       //         "La commande que vous avez choisie est fait par ${widget.subtitle}"
                      //       //         " en respectant toutes les mesures d'hygéne,"
                      //       //         " nous somme à votre disposition pour plus de détails."),
                      //       //   ),
                      //       // ),
                      //     ],
                      //   ),
                      // ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              //Text(widget.token),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    user.add(user);
                                  });
                                },
                                child: Center(
                                  child: Container(
                                    // height: 64,
                                    // width: 240,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    width: size.width * 0.8,
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(29),
                                        child: FlatButton(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 40),
                                          color: Colors.black,
                                          onPressed: () {
                                            if (selectedCounter >= 1) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Commande(
                                                            idp: widget.idp,
                                                            userid:
                                                                widget.userid,
                                                            token: widget.token,
                                                            sum: sum,
                                                            nomP: widget.nomP,
                                                            subtitle:
                                                                widget.subtitle,
                                                            selectedCounter:
                                                                selectedCounter,
                                                            logoP: widget.logoP,
                                                          )));
                                            } else {
                                              print("invalide");
                                              displayDialog(
                                                  context,
                                                  "Vérifier votre saisie",
                                                  "Ajouter au moins une commande sur ce produit");
                                            }
                                          },
                                          child: Text(
                                            "Commander",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      // RaisedButton(
                                      //   child: Text(
                                      //     "Valider Commander",
                                      //     style: TextStyle(
                                      //       color: Colors.black,
                                      //       fontSize: 18,
                                      //       fontWeight: FontWeight.bold,
                                      //     ),
                                      //   ),
                                      //   onPressed: () {
                                      //     Navigator.of(context).push(MaterialPageRoute(
                                      //         builder: (context) => Commande(
                                      //               sum: sum,
                                      //               selectedCounter: selectedCounter,
                                      //               productId: productId,
                                      //               idBoul: idBoul,
                                      //             )));
                                      //   },
                                      // ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : contraints.maxWidth < 800
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Hero(
                                tag: "cafe",
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 16, right: 16, top: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(widget.logoP),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.nomP,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.subtitle,
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 38,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedCounter--;
                                                sumPriceRm();
                                                // if (selectedCounter < 1) {
                                                //   print("under 1 blocking");
                                                // } else {
                                                //   selectedCounter--;
                                                //   sumPriceRm();
                                                //   //user.remove(user);
                                                // }
                                              });
                                            },
                                            child: Center(
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Center(
                                                child: Text(
                                              selectedCounter.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                // if (selectedCounter >= 1) {
                                                //   // print("under 1 blocking");
                                                //   selectedCounter++;
                                                //   sumPriceadd();
                                                // } else {
                                                //   print("under 1 blocking");
                                                //   // selectedCounter++;
                                                //   // sumPriceadd();
                                                //   //user.remove(user);
                                                // }
                                                selectedCounter++;
                                                sumPriceadd();
                                                //user.add(user);
                                              });
                                            },
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Total : $sum F",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Expanded(
                          //   flex: 3,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: <Widget>[
                          //       //Padding(padding: EdgeInsets.only(right: 300.0)),
                          //       // Container(
                          //       //   padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                          //       //   child: Text(
                          //       //     "Description",
                          //       //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          //       //   ),
                          //       // ),
                          //       // SizedBox(
                          //       //   height: 8,
                          //       // ),
                          //       // SingleChildScrollView(
                          //       //   child: Container(
                          //       //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                          //       //     height: 70,
                          //       //     decoration: BoxDecoration(
                          //       //       gradient: LinearGradient(
                          //       //         colors: [Colors.black, Colors.white.withOpacity(0.8)],
                          //       //         end: Alignment.center,
                          //       //         stops: [0.0, 0.5],
                          //       //       ),
                          //       //     ),
                          //       //     child: Text(
                          //       //         "La commande que vous avez choisie est fait par ${widget.subtitle}"
                          //       //         " en respectant toutes les mesures d'hygéne,"
                          //       //         " nous somme à votre disposition pour plus de détails."),
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //Text(widget.token),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        user.add(user);
                                      });
                                    },
                                    child: Center(
                                      child: Container(
                                        // height: 64,
                                        // width: 240,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        width: size.width * 0.8,
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(29),
                                            child: FlatButton(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 40),
                                              color: Colors.black,
                                              onPressed: () {
                                                if (selectedCounter >= 1) {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Commande(
                                                                idp: widget.idp,
                                                                userid: widget
                                                                    .userid,
                                                                token: widget
                                                                    .token,
                                                                sum: sum,
                                                                nomP:
                                                                    widget.nomP,
                                                                subtitle: widget
                                                                    .subtitle,
                                                                selectedCounter:
                                                                    selectedCounter,
                                                                logoP: widget
                                                                    .logoP,
                                                              )));
                                                } else {
                                                  print("invalide");
                                                  displayDialog(
                                                      context,
                                                      "Vérifier votre saisie",
                                                      "Ajouter au moins une commande sur ce produit");
                                                }
                                              },
                                              child: Text(
                                                "Commander",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          // RaisedButton(
                                          //   child: Text(
                                          //     "Valider Commander",
                                          //     style: TextStyle(
                                          //       color: Colors.black,
                                          //       fontSize: 18,
                                          //       fontWeight: FontWeight.bold,
                                          //     ),
                                          //   ),
                                          //   onPressed: () {
                                          //     Navigator.of(context).push(MaterialPageRoute(
                                          //         builder: (context) => Commande(
                                          //               sum: sum,
                                          //               selectedCounter: selectedCounter,
                                          //               productId: productId,
                                          //               idBoul: idBoul,
                                          //             )));
                                          //   },
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Hero(
                                tag: "cafe",
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 16, right: 16, top: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(widget.logoP),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 100, left: 16, right: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.nomP,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // SizedBox(
                                  //   height: 8,
                                  // ),
                                  Text(
                                    widget.subtitle,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 38,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedCounter--;
                                                sumPriceRm();
                                                // if (selectedCounter < 1) {
                                                //   print("under 1 blocking");
                                                // } else {
                                                //   selectedCounter--;
                                                //   sumPriceRm();
                                                //   //user.remove(user);
                                                // }
                                              });
                                            },
                                            child: Center(
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Center(
                                                child: Text(
                                              selectedCounter.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                // if (selectedCounter >= 1) {
                                                //   // print("under 1 blocking");
                                                //   selectedCounter++;
                                                //   sumPriceadd();
                                                // } else {
                                                //   print("under 1 blocking");
                                                //   // selectedCounter++;
                                                //   // sumPriceadd();
                                                //   //user.remove(user);
                                                // }
                                                selectedCounter++;
                                                sumPriceadd();
                                                //user.add(user);
                                              });
                                            },
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Total : $sum F",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Expanded(
                          //   flex: 3,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: <Widget>[
                          //       //Padding(padding: EdgeInsets.only(right: 300.0)),
                          //       // Container(
                          //       //   padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                          //       //   child: Text(
                          //       //     "Description",
                          //       //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          //       //   ),
                          //       // ),
                          //       // SizedBox(
                          //       //   height: 8,
                          //       // ),
                          //       // SingleChildScrollView(
                          //       //   child: Container(
                          //       //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                          //       //     height: 70,
                          //       //     decoration: BoxDecoration(
                          //       //       gradient: LinearGradient(
                          //       //         colors: [Colors.black, Colors.white.withOpacity(0.8)],
                          //       //         end: Alignment.center,
                          //       //         stops: [0.0, 0.5],
                          //       //       ),
                          //       //     ),
                          //       //     child: Text(
                          //       //         "La commande que vous avez choisie est fait par ${widget.subtitle}"
                          //       //         " en respectant toutes les mesures d'hygéne,"
                          //       //         " nous somme à votre disposition pour plus de détails."),
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 115),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //Text(widget.token),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        user.add(user);
                                      });
                                    },
                                    child: Center(
                                      child: Container(
                                        // height: 64,
                                        // width: 240,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                        width: size.width * 0.8,
                                        child: Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(29),
                                            child: FlatButton(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 40),
                                              color: Colors.black,
                                              onPressed: () {
                                                if (selectedCounter >= 1) {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Commande(
                                                                idp: widget.idp,
                                                                userid: widget
                                                                    .userid,
                                                                token: widget
                                                                    .token,
                                                                sum: sum,
                                                                nomP:
                                                                    widget.nomP,
                                                                subtitle: widget
                                                                    .subtitle,
                                                                selectedCounter:
                                                                    selectedCounter,
                                                                logoP: widget
                                                                    .logoP,
                                                              )));
                                                } else {
                                                  print("invalide");
                                                  displayDialog(
                                                      context,
                                                      "Vérifier votre saisie",
                                                      "Ajouter au moins une commande sur ce produit");
                                                }
                                              },
                                              child: Text(
                                                "Commander",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          // RaisedButton(
                                          //   child: Text(
                                          //     "Valider Commander",
                                          //     style: TextStyle(
                                          //       color: Colors.black,
                                          //       fontSize: 18,
                                          //       fontWeight: FontWeight.bold,
                                          //     ),
                                          //   ),
                                          //   onPressed: () {
                                          //     Navigator.of(context).push(MaterialPageRoute(
                                          //         builder: (context) => Commande(
                                          //               sum: sum,
                                          //               selectedCounter: selectedCounter,
                                          //               productId: productId,
                                          //               idBoul: idBoul,
                                          //             )));
                                          //   },
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
          },
        ),
      ),
    );
  }
}
