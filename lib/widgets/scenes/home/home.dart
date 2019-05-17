import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../custom/index.dart';
import '../../../bloc/index.dart';
import '../../../styles/index.dart';
import '../../../blog_app.dart';
import '../index.dart';

class Main extends StatefulWidget {
  final BlogOptions options;
  final onChanged;

  Main(this.options, this.onChanged);

  MainState createState() => MainState();
}
class MainState extends State<Main> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildAppBar(context) {
    return AppBar(
      backgroundColor: white,
      centerTitle: true,
      title: Center(
        child: Text(
          "HYPEBEAST",
          style: Theme.of(context).textTheme.body2.copyWith(
              color: black, fontSize: 24.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          iconSize: 30.0,
          color: black,
          onPressed: () {},
        )
      ],
      bottom: TabBar(
        controller: _tabController, 
        indicatorColor: black,
        tabs: <Widget>[
          Tab(
            child: Container(
              child: Text("YOUR FEED", style: Theme.of(context).textTheme.body2.copyWith(color: black)),
            ),
          ),
          Tab(
            child: Container(
              child: Text("LATEST", style: Theme.of(context).textTheme.body2.copyWith(color: black)),
            ),
          ),
          Tab(
            child: Container(
              child: Text("POPULAR", style: Theme.of(context).textTheme.body2.copyWith(color: black)),
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Latest(),
          Latest(),
          Latest(),
        ],
      ),
    );
  }
}
