import 'dart:async';
import 'package:flutter/material.dart';

import '../../../utils/index.dart';
import '../../../styles/index.dart';

const kDurationInSeconds = Duration(seconds: 5);
class Splash extends StatefulWidget {

  SplashState createState() => SplashState();
}
class SplashState extends State<Splash> {

  StreamSubscription _connectionChangeStream;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    super.initState();

    ConnectionStatusSingleton _connectionStatus = ConnectionStatusSingleton.getInstance();
    _connectionChangeStream = _connectionStatus.connectionChange.listen(connectionChanged);

    goToHome();
  }

  void connectionChanged(dynamic hasConnection) {
    if(!hasConnection) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("No internet connection, please connect to an internet"),));
    }
  }

  dispose() {
    _connectionChangeStream.cancel();
    super.dispose();
  }

  Future<void> goToHome() async{
    return Timer(kDurationInSeconds, () => Navigator.of(context).pushReplacementNamed("/Main"));
  }

  Widget _buildSplashData(context) {
    return Container(
      color: black,
      child: Center(
        child: Image.asset(
          'lib/assets/logo/vibzn-logo.png',
          width: 200.0,
        )
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          _buildSplashData(context),
        ],
      ),
    );
  }
}