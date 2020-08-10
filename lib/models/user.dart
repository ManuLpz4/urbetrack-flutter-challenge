import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String username;

  const User({
    @required this.id,
    @required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['sub'],
      username: json['username'],
    );
  }
}
