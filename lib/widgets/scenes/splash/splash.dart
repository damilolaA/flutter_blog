import 'dart:async';
import 'package:flutter/material.dart';

import '../../../utils/index.dart';
import '../../../styles/index.dart';

class Splash extends StatefulWidget {

  SplashState createState() => SplashState();
}
class SplashState extends State<Splash> {

  StreamSubscription _connectionChangeStream;

  bool isOffline = false;

  @override
  void initState() {
    super.initState();

    ConnectionStatusSingleton _connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = _connectionStatus.connectionChange.listen(connectionChanged);
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      isOffline = !hasConnection;
    });
  }

  dispose() {
    _connectionChangeStream.cancel();
    super.dispose();
  }

  Widget _buildSplashData(context) {
    return Container(
      color: black,
      padding: EdgeInsets.symmetric(vertical: 150.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'lib/assets/logo/vibzn-logo.png',
              width: 200.0,
            )
          ),
          // Center(
          //   child: SizedBox(
          //     width: 30.0,
          //     height: 30.0,
          //     child: CircularProgressIndicator(
          //       value: null,
          //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildConnectionFrame() {
    final connectionText = isOffline ? "Not connected" : "Connected";
    return SafeArea(
      top: false,
      child: Material(
        elevation: 6.0,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '$connectionText',
              style: TextStyle(color: Colors.white),
            ),
          ]
        ),
      )
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildSplashData(context),
          _buildConnectionFrame(),
        ],
      ),
    );
  }
}