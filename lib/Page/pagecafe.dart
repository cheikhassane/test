//import 'package:dakar_cafe_express/Page/commande.dart';
import 'package:dakar_cafe_express/Page/detailcmd.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PageCafe extends StatefulWidget {
  final String username;
  final String level;
  final String logoP;
  final String nomP;
  final String priceP;
  final String subtitle;

  PageCafe(
      {this.username,
      this.level,
      this.logoP,
      this.nomP,
      this.priceP,
      this.subtitle});

  @override
  _PageCafeState createState() => _PageCafeState();
}

class _PageCafeState extends State<PageCafe> {
  final String url = "https://15ace0af691a.ngrok.io/produit";

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
        actions: [Image(image: AssetImage("assets/logoapp.jpeg"))],
        // leading: Image(image: AssetImage("assets/Icone-.png")),
      ),
      body: Container(
        child: FutureBuilder(
            future: getProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final logoP = "${snapshot.data[index]["logoProduit"]}";
                    final nomP = "${snapshot.data[index]["nomProduit"]}";
                    final priceP = "${snapshot.data[index]["prix"]}";
                    final subtitle = "${snapshot.data[index]["subtitle"]}";
                    return Container(
                      //elevation: 0,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          color: Colors.white),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detailcmd(
                                          logoP: logoP,
                                          nomP: nomP,
                                          priceP: priceP,
                                          subtitle: subtitle,
                                        )));
                          },
                          child: Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                    "${snapshot.data[index]["logoProduit"]}"),
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                              ),
// SizedBox(
//   height: 10,
// ),
                              Text(
                                "${snapshot.data[index]["nomProduit"]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
// SizedBox(
//   height: 10,
//),
                              Text(
                                "${snapshot.data[index]["subtitle"]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${snapshot.data[index]["prix"].toString()}F",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
//       CustomScrollView(
//         slivers: <Widget>[
//           SliverAppBar(
//             floating: false,
//             expandedHeight: 100,
//             flexibleSpace: FlexibleSpaceBar(
//               titlePadding: EdgeInsets.only(left: 20),
//               title: Text(
//                 "Dakar Café Express",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//               background: Image.asset(
//                 "assets/Icone-.png",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             //backgroundColor: Colors.black,
//             elevation: 10,
//           ),
//           SliverGrid(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5,
//                 childAspectRatio: 0.8),
//             delegate: SliverChildListDelegate([
//               FutureBuilder(
//                   future: getProduct(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return ListView.builder(
//                         itemCount: snapshot.data.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             //elevation: 0,
//                             //color: Colors.white,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(29),
//                                 color: Colors.white),
//                             margin: EdgeInsets.all(10.0),
//                             child: Padding(
//                               padding: EdgeInsets.all(15.0),
//                               child: Column(
//                                 children: [
//                                   Image(
//                                     image: NetworkImage(
//                                         "${snapshot.data[index]["logoProduit"]}"),
//                                     //fit: BoxFit.cover,
//                                     // height: 280,
//                                     // width: 100,
//                                   ),
// // SizedBox(
// //   height: 10,
// // ),
//                                   Text(
//                                     "${snapshot.data[index]["nomProduit"]}",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold),
//                                   ),
// // SizedBox(
// //   height: 10,
// //),
//                                   Text(
//                                     "${snapshot.data[index]["subtitle"]}",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "${snapshot.data[index]["prix"].toString()}F",
//                                     style: TextStyle(
//                                         color: Colors.black, fontSize: 15),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text("${snapshot.error}");
//                     }
//                     return Center(child: CircularProgressIndicator());
//                   }),
//             ]),
//           ),
//           // SliverGrid(
//           //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           //       crossAxisCount: 2,
//           //       crossAxisSpacing: 10,
//           //       mainAxisSpacing: 10,
//           //       childAspectRatio: 1),
//           //   delegate: SliverChildListDelegate([
//           //     Container(
//           //       decoration: BoxDecoration(
//           //           borderRadius: BorderRadius.circular(29),
//           //           color: Colors.white),
//           //       child: InkWell(
//           //         onTap: () {
//           //           Navigator.push(context,
//           //               MaterialPageRoute(builder: (context) => Commande()));
//           //         },
//           //         child: Stack(
//           //           children: <Widget>[
//           //             Column(
//           //               children: [
//           //                 Image(
//           //                   image: AssetImage("assets/cap1.jpeg"),
//           //                   fit: BoxFit.cover,
//           //                   height: 100,
//           //                   width: 200,
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "Capsule 1",
//           //                   style: TextStyle(
//           //                       color: Colors.black,
//           //                       fontSize: 20,
//           //                       fontWeight: FontWeight.bold),
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "150F",
//           //                   style: TextStyle(color: Colors.black, fontSize: 12),
//           //                 ),
//           //               ],
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //       // ListTile(
//           //       //   title: Text(
//           //       //     "Capsule 1",
//           //       //     style: TextStyle(color: Colors.black, fontSize: 20),
//           //       //   ),
//           //       //   leading: CircleAvatar(
//           //       //     child: Image.asset("assets/cap1.jpeg"),
//           //       //   ),
//           //       // ),
//           //     ),
//           //     Container(
//           //         decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(29),
//           //             color: Colors.white),
//           //         child: Stack(
//           //           children: <Widget>[
//           //             Column(
//           //               children: [
//           //                 Image(
//           //                   image: AssetImage("assets/cap2.jpg"),
//           //                   fit: BoxFit.cover,
//           //                   height: 100,
//           //                   width: 200,
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "Capsule 2",
//           //                   style: TextStyle(
//           //                       color: Colors.black,
//           //                       fontSize: 20,
//           //                       fontWeight: FontWeight.bold),
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "250F",
//           //                   style: TextStyle(color: Colors.black, fontSize: 12),
//           //                 ),
//           //               ],
//           //             ),
//           //           ],
//           //         )
//           //         // ListTile(
//           //         //   title: Text(
//           //         //     "Capsule 2",
//           //         //     style: TextStyle(color: Colors.black),
//           //         //   ),
//           //         //   leading: CircleAvatar(
//           //         //     child: Image.asset("assets/cap2.jpg"),
//           //         //   ),
//           //         // ),
//           //         ),
//           //     Container(
//           //         decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(29),
//           //             color: Colors.white),
//           //         child: Stack(
//           //           children: <Widget>[
//           //             Column(
//           //               children: [
//           //                 Image(
//           //                   image: AssetImage("assets/cap3.jpeg"),
//           //                   fit: BoxFit.cover,
//           //                   height: 100,
//           //                   width: 200,
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "Capsule 3",
//           //                   style: TextStyle(
//           //                       color: Colors.black,
//           //                       fontSize: 20,
//           //                       fontWeight: FontWeight.bold),
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "350F",
//           //                   style: TextStyle(color: Colors.black, fontSize: 12),
//           //                 ),
//           //               ],
//           //             ),
//           //           ],
//           //         )
//           //         // ListTile(
//           //         //   title: Text(
//           //         //     "Capsule 3",
//           //         //     style: TextStyle(color: Colors.black),
//           //         //   ),
//           //         //   leading: CircleAvatar(
//           //         //     child: Image.asset("assets/cap3.jpeg"),
//           //         //   ),
//           //         // ),
//           //         ),
//           //     Container(
//           //         decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(29),
//           //             color: Colors.white),
//           //         child: Stack(
//           //           children: <Widget>[
//           //             Column(
//           //               children: [
//           //                 Image(
//           //                   image: AssetImage("assets/cap4.jpeg"),
//           //                   fit: BoxFit.cover,
//           //                   height: 100,
//           //                   width: 200,
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "Capsule 4",
//           //                   style: TextStyle(
//           //                       color: Colors.black,
//           //                       fontSize: 20,
//           //                       fontWeight: FontWeight.bold),
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "450F",
//           //                   style: TextStyle(color: Colors.black, fontSize: 12),
//           //                 ),
//           //               ],
//           //             ),
//           //           ],
//           //         )
//           //         // ListTile(
//           //         //   title: Text(
//           //         //     "Capsule 4",
//           //         //     style: TextStyle(color: Colors.black),
//           //         //   ),
//           //         //   leading: CircleAvatar(
//           //         //     child: Image.asset("assets/cap4.jpeg"),
//           //         //   ),
//           //         // ),
//           //         ),
//           //     Container(
//           //         decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(29),
//           //             color: Colors.white),
//           //         child: Stack(
//           //           children: <Widget>[
//           //             Column(
//           //               children: [
//           //                 Image(
//           //                   image: AssetImage("assets/cap5.jpeg"),
//           //                   fit: BoxFit.cover,
//           //                   height: 100,
//           //                   width: 200,
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "Capsule 5",
//           //                   style: TextStyle(
//           //                       color: Colors.black,
//           //                       fontSize: 20,
//           //                       fontWeight: FontWeight.bold),
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "450F",
//           //                   style: TextStyle(color: Colors.black, fontSize: 12),
//           //                 ),
//           //               ],
//           //             ),
//           //           ],
//           //         )
//           //         // ListTile(
//           //         //   title: Text(
//           //         //     "Capsule 5",
//           //         //     style: TextStyle(color: Colors.black),
//           //         //   ),
//           //         //   leading: CircleAvatar(
//           //         //     child: Image.asset("assets/cap5.jpeg"),
//           //         //   ),
//           //         // ),
//           //         ),
//           //     Container(
//           //         decoration: BoxDecoration(
//           //             borderRadius: BorderRadius.circular(29),
//           //             color: Colors.white),
//           //         child: Stack(
//           //           children: <Widget>[
//           //             Column(
//           //               children: [
//           //                 Image(
//           //                   image: AssetImage("assets/cap6.jpeg"),
//           //                   fit: BoxFit.cover,
//           //                   height: 100,
//           //                   width: 200,
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "Capsule 6",
//           //                   style: TextStyle(
//           //                       color: Colors.black,
//           //                       fontSize: 20,
//           //                       fontWeight: FontWeight.bold),
//           //                 ),
//           //                 SizedBox(
//           //                   height: 10,
//           //                 ),
//           //                 Text(
//           //                   "250F",
//           //                   style: TextStyle(color: Colors.black, fontSize: 12),
//           //                 ),
//           //               ],
//           //             ),
//           //           ],
//           //         )
//           //         // ListTile(
//           //         //   title: Text(
//           //         //     "Capsule 6",
//           //         //     style: TextStyle(color: Colors.black),
//           //         //   ),
//           //         //   leading: CircleAvatar(
//           //         //     child: Image.asset("assets/cap6.jpeg"),
//           //         //   ),
//           //         // ),
//           //         ),
//           //   ]),
//           // ),
//         ],
//       ),
    );
  }
}

// SliverChildBuilderDelegate((context, index) {
//               return FutureBuilder(
//                   future: getProduct(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return ListView.builder(
//                         itemCount: snapshot.data.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             //elevation: 0,
//                             //color: Colors.white,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(29),
//                                 color: Colors.white),
//                             margin: EdgeInsets.all(8.0),
//                             child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Image(
//                                     image: NetworkImage(
//                                         "${snapshot.data[index]["logoProduit"]}"),
//                                     //fit: BoxFit.cover,
//                                     // height: 280,
//                                     // width: 100,
//                                   ),
// // SizedBox(
// //   height: 10,
// // ),
//                                   Text(
//                                     "${snapshot.data[index]["nomProduit"]}",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold),
//                                   ),
// // SizedBox(
// //   height: 10,
// //),
//                                   Text(
//                                     "${snapshot.data[index]["subtitle"]}",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     "${snapshot.data[index]["prix"].toString()}F",
//                                     style: TextStyle(
//                                         color: Colors.black, fontSize: 15),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text("${snapshot.error}");
//                     }
//                     return Center(child: CircularProgressIndicator());
//                   });
//             }, childCount: 1),
