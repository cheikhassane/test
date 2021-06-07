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
    // final productId = widget.idProduct;
    //final name = widget.userid;
    Size size = MediaQuery.of(context).size;
    //final idpro = widget.idp;
    //  user.forEach((f){
    //   sumPrice += int.parse(f.widget.selectItemPrice.substring(0,3));
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dakar Café Express",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [Image(image: AssetImage("assets/logoa.png"))],
        // leading: Image(image: AssetImage("assets/Icone-.png")),
      ),
      // drawer: Drawer(
      //     child: new ListView(
      //   children: [
      //     new UserAccountsDrawerHeader(
      //       accountName: name == null ? null : Text(name),
      //       accountEmail: Text(""),
      //       currentAccountPicture: new CircleAvatar(
      //         backgroundColor: Colors.transparent,
      //         child: Image(
      //           image: AssetImage("assets/logoa.png"),
      //           fit: BoxFit.cover,
      //           height: 100,
      //           width: 100,
      //         ),
      //         //Text("A"),
      //       ),
      //     ),
      //     // ListTile(
      //     //   title: Text("Connexion"),
      //     //   trailing: Icon(Icons.person),
      //     //   onTap: () {
      //     //     Navigator.push(
      //     //         context, MaterialPageRoute(builder: (context) => Login()));
      //     //   },
      //     // ),
      //     ListTile(
      //       title: Text("Créer compte"),
      //       trailing: Icon(Icons.add),
      //       onTap: () {
      //         // Navigator.of(context).pop();
      //         // Scaffold.of(context).showSnackBar(new SnackBar(
      //         //   content: new Text("you click me "),
      //         //   duration: new Duration(seconds: 4),
      //         // ));
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (context) => Adduser()));
      //       },
      //     ),
      //     ListTile(
      //       title: name == null ? Text("Connexion") : Text("Deconnexion"),
      //       trailing: Icon(Icons.outbox),
      //       onTap: () {
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (context) => Accueil()));
      //       },
      //     ),
      //   ],
      // )
      //     //Mydrawer(userid: widget.userid)
      //     ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Expanded(
          //   flex: 1,
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: IconButton(
          //       icon: Icon(Icons.chevron_left),
          //       onPressed: () {
          //         setState(() {
          //           // containerHeight = 500.4545454545455;
          //           // _borderRadiusGeometry = BorderRadius.only(
          //           //   bottomLeft: Radius.circular(32),
          //           //   bottomRight: Radius.circular(32),
          //           // );
          //           // selectedTrigger = !selectedTrigger;
          //         });
          //       },
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 4,
            child: Hero(
                tag: "cafe",
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logoa.png"),
                      //NetworkImage(widget.logoP),
                    ),
                  ),
                )
                /*
                            child: Image.network(selectedPain.imgPath, 
                            width: 150, height: 140, 
                            alignment: Alignment.center,
                            ),*/

                ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.nomP,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(color: Colors.grey),
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
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (selectedCounter < 1) {
                                  print("under 1 blocking");
                                } else {
                                  selectedCounter--;
                                  sumPriceRm();
                                  //user.remove(user);
                                }
                              });
                            },
                            child: Center(
                              child: Icon(Icons.remove),
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
                              ),
                            )),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedCounter++;
                                sumPriceadd();
                                //user.add(user);
                              });
                            },
                            child: Center(
                              child: Icon(Icons.add),
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
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Padding(padding: EdgeInsets.only(right: 300.0)),
                // Container(
                //   padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                //   child: Text(
                //     "Description",
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // SizedBox(
                //   height: 8,
                // ),
                // SingleChildScrollView(
                //   child: Container(
                //     padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                //     height: 70,
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [Colors.black, Colors.white.withOpacity(0.8)],
                //         end: Alignment.center,
                //         stops: [0.0, 0.5],
                //       ),
                //     ),
                //     child: Text(
                //         "La commande que vous avez choisie est fait par ${widget.subtitle}"
                //         " en respectant toutes les mesures d'hygéne,"
                //         " nous somme à votre disposition pour plus de détails."),
                //   ),
                // ),
              ],
            ),
          ),
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Commande(
                                          idp: widget.idp,
                                          userid: widget.userid,
                                          token: widget.token,
                                          sum: sum,
                                          nomP: widget.nomP,
                                          subtitle: widget.subtitle,
                                          selectedCounter: selectedCounter,
                                        )));
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
      ),
    );
  }
}
