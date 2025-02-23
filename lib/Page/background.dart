import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/cap1.jpeg"),
            height: 500,
            width: 500,
            fit: BoxFit.cover,
          ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Image.asset(
          //     "assets/cap1.jpeg",
          //     width: size.width * 0.3,
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: Image.asset(
          //     "assets/cap1.jpeg",
          //     width: size.width * 0.2,
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}
