import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:urbetrack_flutter_challenge/pages/home/home_page.dart';
import 'package:urbetrack_flutter_challenge/pages/picture/picture_page.dart';
import 'package:urbetrack_flutter_challenge/pages/profile/profile_page.dart';
import 'package:urbetrack_flutter_challenge/pages/sign_in/sign_in_page.dart';
import 'package:urbetrack_flutter_challenge/pages/splash/splash_page.dart';
import 'package:urbetrack_flutter_challenge/utils/constants.dart';

const String initialRoute = RouteName.initial_route;

Route<Widget> onGenerateRoute(RouteSettings settings) {
  return CupertinoPageRoute<Widget>(
    settings: settings,
    builder: (_) {
      switch (settings.name) {
        case RouteName.initial_route:
          return SplashPage();
        case RouteName.home:
          return HomePage();
        case RouteName.picture:
          return PicturePage(settings.arguments);
        case RouteName.profile:
          return ProfilePage();
        case RouteName.sign_in:
          return SignInPage();
        default:
          return null;
      }
    },
  );
}
