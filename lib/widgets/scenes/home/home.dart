import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../custom/index.dart';
import '../../../bloc/index.dart';
import '../../../styles/index.dart';
import '../../../blog_app.dart';


class Main extends StatelessWidget {
  Main(this.options, this.onChanged);

  final BlogOptions options;
  final onChanged;
  
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("Hello Flutter"),
  //     ),
  //     body: Container(
  //       child: Center(
  //         child: Text("Hello World"),
  //       ),
  //     ),
  //   );
  // }

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
    );
  }
}