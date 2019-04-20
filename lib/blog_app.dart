import 'package:flutter/material.dart';
import 'app_config.dart';

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
            
          ),
        ),
      ),
    );
  }
}