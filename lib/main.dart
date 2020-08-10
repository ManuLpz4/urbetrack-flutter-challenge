import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:urbetrack_flutter_challenge/providers/auth_provider.dart';
import 'package:urbetrack_flutter_challenge/providers/pictures_provider.dart';
import 'package:urbetrack_flutter_challenge/providers/theme_provider.dart';
import 'package:urbetrack_flutter_challenge/utils/routes.dart';
import 'package:urbetrack_flutter_challenge/utils/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(
          create: (_) => AuthProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<PicturesProvider>(
          create: (_) => PicturesProvider(),
        ),
      ],
      child: Consumer(
        builder: (_, ThemeProvider themeProvider, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.isDarkTheme ? AppThemes.dark : AppThemes.light,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
