import 'package:flutter/material.dart';

class Latest extends StatefulWidget{

  LatestState createState() => LatestState();
}

class LatestState extends State<Latest> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.accessibility, size: 50.0, color: Colors.brown,),
      ),
    );
  }
}