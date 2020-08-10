import 'package:flutter/material.dart';

import 'package:urbetrack_flutter_challenge/pages/home/widgets/pictures_sliver_list.dart';
import 'package:urbetrack_flutter_challenge/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text('Urbetrack'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, RouteName.profile),
                    child: const CircleAvatar(
                      backgroundImage:
                          const AssetImage('assets/images/profile_picture.jpg'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const PicturesSliverList(),
        ],
      ),
    );
  }
}
