import 'package:flutter/material.dart';
import 'app_config.dart';
import 'styles/index.dart';
import 'custom/index.dart';

class BlogApp extends StatefulWidget {

  final AppConfig config;

  BlogApp({Key key, @required this.config}) : super(key: key);

  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  BlogOptions _options;

  @override
  void initState() {
    super.initState();
    _options = BlogOptions(
      theme: kLighttheme
    );
  }

  void onOptionsChanged(BlogOptions newOptions) {
    setState(() {
      _options = newOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blog App",
      theme: _options.theme.data,
      debugShowCheckedModeBanner: false,
      home: Home(_options, onOptionsChanged),
    );
  }
}

class Home extends StatelessWidget {
  Home(this.options, this.onChanged);

  final BlogOptions options;
  final onChanged;
  
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Switch(
                  value: options.theme == kDarktheme,
                  onChanged: (bool value) {
                    onChanged(options.copyWith(
                      theme: value ? kDarktheme : kLighttheme
                    ));
                  },
                  activeColor: const Color(0xFF39CEFD),
                  activeTrackColor: isDark ? Colors.white30 : Colors.black26
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTheme {
  const BlogTheme._(this.name, this.data);

  final String name;
  final ThemeData data;
}

final BlogTheme kLighttheme = BlogTheme._("light", _buildLightTheme());
final BlogTheme kDarktheme = BlogTheme._("dark", _buildDarkTheme());

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