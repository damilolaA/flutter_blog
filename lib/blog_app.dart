import 'package:flutter/material.dart';
import 'app_config.dart';
import 'styles/index.dart';

class BlogApp extends StatefulWidget {

  final AppConfig config;

  BlogApp({Key key, @required this.config}) : super(key: key);

  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blog App",
      theme: _theme,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Text("Hello World"),)
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTheme {
  BlogTheme(this.name, this.data);

  final String name;
  final ThemeData data;
}

final BlogTheme kLighttheme = BlogTheme("light", _buildLightTheme());
final BlogTheme kDarktheme = BlogTheme("dark", _buildDarkTheme());

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: primary,
    brightness: Brightness.dark
  );
}

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: primary,
    brightness: Brightness.light
  );
}