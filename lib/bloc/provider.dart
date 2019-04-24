import 'package:flutter/widgets.dart';
import '../app_config.dart';

/// App wide state provider class
class AppProvider extends InheritedWidget {
  final AppConfig config;

  AppProvider({
    Key key,
    @required this.config,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppConfig of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider)
          .config;
}
