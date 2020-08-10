import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:urbetrack_flutter_challenge/pages/home/widgets/picture_list_tile.dart';
import 'package:urbetrack_flutter_challenge/providers/pictures_provider.dart';

class PicturesSliverList extends StatelessWidget {
  const PicturesSliverList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PicturesProvider>(
      builder: (_, PicturesProvider picturesProvider, __) {
        if (picturesProvider.pictures != null) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int i) => PictureListTile(picturesProvider.pictures[i]),
              childCount: picturesProvider.pictures.length,
            ),
          );
        }

        return SliverFillRemaining(
          hasScrollBody: false,
          child: const Center(
            child: const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
