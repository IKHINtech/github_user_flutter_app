import 'package:flutter/material.dart';
import 'package:github_app/bloc/github_bloc.dart';
import 'package:github_app/model/user.dart';
import 'package:github_app/ui/search_page.dart';
import 'package:github_app/widgets/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.fetchListUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Github User'),
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SearchPage())),
                icon: const Icon(Icons.search))
          ],
        ),
        body: StreamBuilder<List<User>>(
            stream: _userBloc.streamUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return SizedBox(
                    height: 350,
                    child: Center(
                      child: Text('No History Data'),
                    ),
                  );
                } else {
                  return userItem(snapshot.data!);
                }
              } else if (snapshot.hasError) {
                if (snapshot.error == 'LOADING') {
                  return Text('loading');
                } else {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                }
              }
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.amber, size: 30),
              );
            }),
      ),
    );
  }
}
