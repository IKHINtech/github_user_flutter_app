class MyGlobal {
  static final MyGlobal _instance = MyGlobal._internal();
  factory MyGlobal() => _instance;
  String token = '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';
  String? userId;
  bool? login;

  MyGlobal._internal() {
    login = false;
  }
}

final appData = MyGlobal();
