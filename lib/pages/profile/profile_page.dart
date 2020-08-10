import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:urbetrack_flutter_challenge/providers/auth_provider.dart';
import 'package:urbetrack_flutter_challenge/providers/theme_provider.dart';
import 'package:urbetrack_flutter_challenge/utils/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Profile'),
            actions: [
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () => _signOut(context),
              ),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 56,
                        backgroundImage: const AssetImage(
                          'assets/images/profile_picture.jpg',
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        context.watch<AuthProvider>().user.username,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Consumer<ThemeProvider>(
                  builder: (_, ThemeProvider themeProvider, __) {
                    return SwitchListTile(
                      value: themeProvider.isDarkTheme,
                      onChanged: (_) => themeProvider.toggleTheme(),
                      secondary: CircleAvatar(
                        backgroundColor: Colors.accents[0],
                        child: const Icon(
                          Icons.brightness_4,
                          color: Colors.white,
                        ),
                      ),
                      title: const Text('Dark theme'),
                      subtitle: Text(
                        themeProvider.isDarkTheme ? 'Enabled' : 'Disabled',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await context.read<AuthProvider>().signOut();
    Navigator.pushNamedAndRemoveUntil(context, RouteName.sign_in, (_) => false);
  }
}
