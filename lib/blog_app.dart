import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_config.dart';
import 'styles/index.dart';
import 'custom/index.dart';
import 'states/index.dart';
import 'events/index.dart';
import './bloc/index.dart';
import './widgets/scenes/index.dart';

class BlogApp extends StatefulWidget {

  final AppConfig config;

  BlogApp({Key key, @required this.config}) : super(key: key);

  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  BlogOptions _options;
  UserBloc _userBloc;
  AuthenticationBloc _authenticationBloc;
  PostsBloc _postsBloc;

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
    _authenticationBloc = AuthenticationBloc();
    _authenticationBloc.dispatch(AppStarted());
    _postsBloc = PostsBloc();
    _postsBloc.dispatch(FetchPost(config: widget.config));
  }

  void _onOptionsChanged(BlogOptions newOptions) {
    setState(() {
      _options = newOptions;
    });
  }

  @override
  void dispose() {
    _userBloc.dispose();
    _authenticationBloc.dispose();
    _postsBloc.dispose();
    super.dispose();
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
          // home: Splash(),
          home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
            bloc: _authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if(state is AuthenticationInitialized) {
                return Splash();
              }else {
                return Container();
              }
            },
          ),
          routes: <String, WidgetBuilder>{
            "/Main": (BuildContext context) => Main(_options, _onOptionsChanged),
          },
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