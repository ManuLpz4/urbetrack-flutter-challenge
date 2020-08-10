import 'package:flutter/material.dart';

import 'package:urbetrack_flutter_challenge/pages/home/home_page.dart';
import 'package:urbetrack_flutter_challenge/pages/sign_in/sign_in_page.dart';
import 'package:urbetrack_flutter_challenge/services/storage_service.dart';
import 'package:urbetrack_flutter_challenge/utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkSignIn();
  }

  Future<void> _checkSignIn() async {
    final String token =
        await StorageService.instance.getEncrypted(StorageKey.token, null);
    setState(() => _isLoggedIn = token != null);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _child(),
    );
  }

  Widget _child() {
    switch (_isLoggedIn) {
      case true:
        return const HomePage();
      case false:
        return const SignInPage();
      default:
        return Container(color: Theme.of(context).accentColor);
    }
  }
}
