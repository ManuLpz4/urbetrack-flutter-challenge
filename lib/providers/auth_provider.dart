import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:urbetrack_flutter_challenge/models/user.dart';
import 'package:urbetrack_flutter_challenge/services/auth_service.dart';
import 'package:urbetrack_flutter_challenge/services/storage_service.dart';
import 'package:urbetrack_flutter_challenge/utils/constants.dart';

class AuthProvider {
  User _user;

  AuthProvider() {
    _setup();
  }

  User get user => _user;

  User _userFromToken(String token) {
    return User(
      id: base64.encode(utf8.encode(token)),
      username: token,
    );
  }

  Future<void> _setup() async {
    final String token =
        await StorageService.instance.getEncrypted(StorageKey.token, null);
    if (token != null) _user = _userFromToken(token);
  }

  Future<bool> signInWithUsernameAndPassword(
    String username,
    String password,
  ) async {
    try {
      final String token = await AuthService.instance
          .signInWithUsernameAndPassword(username, password);

      if (token != null) {
        _user = _userFromToken(token);
        StorageService.instance.setEncrypted(StorageKey.token, token);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return _user != null;
  }

  Future<void> signOut() async {
    _user = null;
    await StorageService.instance.removeAllEncrypted();
  }
}
