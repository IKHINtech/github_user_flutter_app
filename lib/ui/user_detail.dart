import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<Tab> _tabs = [
    Tab(text: 'Following'),
    Tab(child: Text('Follower')),
  ];

  final List<Widget> _views = [
    Center(child: Text('Following')),
    Center(child: Text('Follower')),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('User Detail'),
          flexibleSpace: Container(
            height: 2,
            child: Column(children: [
              Text('data'),
              Row(
                children: [Text('data'), Text('data')],
              )
            ]),
          ),
          bottom: TabBar(controller: _tabController, tabs: _tabs),
        ),
        body: TabBarView(
            controller: _tabController,
            physics: BouncingScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            children: _views),
      ),
    );
  }
}
