class AuthService {
  AuthService._internal();

  static final AuthService instance = AuthService._internal();

  Future<String> signInWithUsernameAndPassword(
    String username,
    String password,
  ) async {
    String token;

    if (password == '123456') token = username;
    await Future.delayed(Duration(seconds: 1));

    return token;
  }
}
