import 'package:flutter/material.dart';

enum Flavor {
  RELEASE,
  DEVELOPMENT
}

class AppConfig {
  
  const AppConfig({
    @required this.flavor,
    @required this.baseApiUrl,
  });

  final String baseApiUrl;
  final Flavor flavor;
}