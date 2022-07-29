import 'package:flutter/material.dart';
import 'package:github_app/model/user.dart';

Widget userItem(List<User> snapshot) {
  return ListView.builder(
    itemCount: snapshot.length,
    itemBuilder: ((context, index) {
      return Card(
        shadowColor: Colors.amberAccent,
        elevation: 2,
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          title: Text(
            snapshot[index].login!,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          leading: CircleAvatar(
            radius: 33,
            foregroundColor: Color(0xffFDCF09),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(snapshot[index].avatarUrl!),
            ),
          ),
        ),
      );
    }),
  );
}
