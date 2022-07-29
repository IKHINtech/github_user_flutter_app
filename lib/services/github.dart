import 'package:dio/dio.dart';
import 'package:github_app/helper/client_api.dart';
import 'package:github_app/model/user.dart';
import 'dart:convert';

class UserGithubServices {
  final Dio api = ClientApi().dio;
  Future<List<User>> fetchListUser() async {
    try {
      final result = await api.get('/users');

      final List resultDecode = json.decode(result.data);
      final List<User> users =
          resultDecode.map((x) => User.fromJson(x)).toList();
      return users;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserDetails> fetchUserDetail(String userName) async {
    try {
      final result = await api.get('/users/$userName');
      final resultDecode = json.decode(result.data);

      return UserDetails.fromJson(resultDecode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<User>> fetchFollowers(String userName) async {
    try {
      final result = await api.get('/users/$userName/followers');
      final List resultDecode = json.decode(result.data);
      final List<User> users =
          resultDecode.map((x) => User.fromJson(x)).toList();
      return users;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<User>> fetchFollowings(String userName) async {
    try {
      final result = await api.get('/users/$userName/following');
      final List resultDecode = json.decode(result.data);
      final List<User> users =
          resultDecode.map((x) => User.fromJson(x)).toList();
      return users;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserHeaders> searchUser(String query) async {
    try {
      final result = await api.get('/search/users?q=$query');
      final resultDecode = json.decode(result.data);
      return UserHeaders.fromJson(resultDecode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
