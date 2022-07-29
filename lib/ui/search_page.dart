import 'package:flutter/material.dart';
import 'package:github_app/bloc/github_bloc.dart';
import 'package:github_app/model/user.dart';
import 'package:github_app/widgets/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controllerSearch = TextEditingController();
  final UserBloc _userBloc = UserBloc();

  showoading() async {
    await showDialog(
        context: (context),
        builder: (builder) {
          return SizedBox(
            height: 80,
            child: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.amber, size: 50),
            ),
          );
        });
  }

  void searchIser(String userName) async {
    showoading();
    await _userBloc.fetchSearchUser(userName);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'cannot null';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controllerSearch.text = value!;
                  },
                  onFieldSubmitted: (value) {
                    searchIser(value);
                  },
                  controller: controllerSearch,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controllerSearch.text = '';
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
        ),
        body: StreamBuilder<UserHeaders>(
            stream: _userBloc.streamSearch,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.items!.isEmpty) {
                  return SizedBox(
                    height: 350,
                    child: Center(
                      child: Text('No History Data'),
                    ),
                  );
                } else {
                  return userItem(snapshot.data!.items!);
                }
              } else if (snapshot.hasError) {
                if (snapshot.error == 'LOADING') {
                  return SizedBox();
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
