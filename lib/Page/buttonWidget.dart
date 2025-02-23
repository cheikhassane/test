import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClicked,
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        shape: StadiumBorder(),
        color: Colors.black,
        //Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textColor: Colors.black,
      );
}
