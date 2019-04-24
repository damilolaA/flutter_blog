import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_config.dart';
import 'styles/index.dart';
import 'custom/index.dart';
import './bloc/index.dart';

class BlogApp extends StatefulWidget {

  final AppConfig config;

  BlogApp({Key key, @required this.config}) : super(key: key);

  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  BlogOptions _options;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _options = BlogOptions(
      theme: kLighttheme
    );
    _createBloc();
  }

  void _createBloc() {
    _userBloc = UserBloc();
  }

  void onOptionsChanged(BlogOptions newOptions) {
    setState(() {
      _options = newOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      config: widget.config,
      child: BlocProvider<UserBloc>(
        bloc: _userBloc,
        child: MaterialApp(
          title: "Blog App",
          theme: _options.theme.data,
          debugShowCheckedModeBanner: false,
          home: Home(_options, onOptionsChanged),
        ),
      ),
    );
    // return MaterialApp(
    //   title: "Blog App",
    //   theme: _options.theme.data,
    //   debugShowCheckedModeBanner: false,
    //   home: Home(_options, onOptionsChanged),
    // );
  }
}

class Home extends StatelessWidget {
  Home(this.options, this.onChanged);

  final BlogOptions options;
  final onChanged;
  
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
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
              ),
              Container(
                child: BlocBuilder<CounterEvent, int>(
                  bloc: _userBloc,
                  builder: (BuildContext context, int count) {
                    return Text(
                      '$count',
                      style: TextStyle(fontSize: 24.0),
                    );
                  },
                )
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _userBloc.dispatch(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                _userBloc.dispatch(CounterEvent.decrement);
              },
            ),
          ),
        ],
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
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Averta"
  );
  return base.copyWith(
    primaryColor: primary,
    brightness: Brightness.dark,
  );
}

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Averta"
  );
  return base.copyWith(
    primaryColor: primary,
    brightness: Brightness.light
  );
}