class LoginManager {
  static final LoginManager _instance = LoginManager._internal();

  LoginManager._internal();

  factory LoginManager() {
    return _instance;
  }

  bool isLoggedIn() {
    return false;
  }

  Future<bool> login(String username, String password) async {
    return false;
  }

  Future<bool> logout() async {
    return false;
  }

  Future<bool> register(
    String email,
    String username,
    String fullName,
    String password,
    String confirmPassword,
    String phoneNumber,
  ) async {
    return false;
  }
}
