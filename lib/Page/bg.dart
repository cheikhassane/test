import 'package:flutter/material.dart';

class HomePageBackground extends StatelessWidget {
  final screenHeight;

  const HomePageBackground({Key key, @required this.screenHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    print(size);

    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        //height: size.height,
        //width: size.width,
        height: screenHeight * 0.3,
        width: screenHeight * 0.68,
        child: Image(
          image: AssetImage("assets/accueil.jpeg"),
          fit: BoxFit.cover,
          // alignment: Alignment.bottomCenter,
        ),
        //color: themeData.primaryColor,
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 1);
    Offset curveEndPoint = Offset(size.width, size.height * 1);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
