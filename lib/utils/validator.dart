class Validator {
  static String validateUsername(String value) {
    if (value.isEmpty) return 'Input a username';
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) return 'Input a password';
    return null;
  }
}
