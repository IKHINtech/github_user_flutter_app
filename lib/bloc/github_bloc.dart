import 'package:github_app/model/user.dart';
import 'package:github_app/services/github.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _listUserFetcher = PublishSubject<List<User>>();
  final _searchUserFetcher = PublishSubject<UserHeaders>();
  final UserGithubServices _listUserService = UserGithubServices();
  late String listUserIdentityId;
  late String searchIdentityId;
  List<User>? lsUser;
  UserHeaders? userHeaders;

  Stream<List<User>> get streamUser => _listUserFetcher.stream;
  Stream<UserHeaders> get streamSearch => _searchUserFetcher.stream;

  dispose() {
    if (_listUserFetcher.isClosed == false) _listUserFetcher.close();
  }

  fetchListUser() async {
    try {
      final String identityId =
          DateTime.now().millisecondsSinceEpoch.toString();
      listUserIdentityId = identityId;

      _listUserFetcher.sink.addError('LOADING');
      lsUser = [];
      lsUser = await _listUserService.fetchListUser();

      if (listUserIdentityId == identityId) {
        _listUserFetcher.sink.add(lsUser!);
      }
    } catch (e) {
      _listUserFetcher.sink.addError(e.toString());
    }
  }

  fetchSearchUser(String userName) async {
    try {
      final String identityId =
          DateTime.now().millisecondsSinceEpoch.toString();
      searchIdentityId = identityId;

      _searchUserFetcher.sink.addError('LOADING');
      userHeaders = await _listUserService.searchUser(userName);

      if (searchIdentityId == identityId) {
        _searchUserFetcher.add(userHeaders!);
      }
    } catch (e) {
      _searchUserFetcher.sink.addError(e.toString());
    }
  }
}
