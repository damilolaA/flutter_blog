import 'package:flutter/material.dart';

import '../../../styles/index.dart';

class Splash extends StatelessWidget {

  Widget build(BuildContext context) {
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
}