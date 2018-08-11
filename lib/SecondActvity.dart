import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
  SecondPage(this.data);
  final data;
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text("Image Detailed"),
    ),
    body: new Center(
      child: new Container(
        width: 150.0,
        height: 150.0,
        decoration: new BoxDecoration(
          color: const Color(0xff7c94b6),
          image: new DecorationImage(
              image: new NetworkImage(data["picture"]["thumbnail"]),
              fit: BoxFit.cover
          ),
          borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
          border: new Border.all(
            color: Colors.red,
            width: 4.0,
          )
        ),
      ),
    ),
  );
}