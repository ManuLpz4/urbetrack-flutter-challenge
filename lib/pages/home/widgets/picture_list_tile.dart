import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:urbetrack_flutter_challenge/models/picture.dart';
import 'package:urbetrack_flutter_challenge/utils/constants.dart';

class PictureListTile extends StatelessWidget {
  final Picture _picture;

  const PictureListTile(this._picture, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteName.picture, arguments: _picture);
      },
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: _picture.width / _picture.height,
            child: CachedNetworkImage(
              imageUrl: _picture.imageUrl,
              fit: BoxFit.cover,
              progressIndicatorBuilder:
                  (_, __, DownloadProgress downloadProgress) {
                return _progressIndicatorBuilder(downloadProgress);
              },
              errorWidget: (_, __, ___) {
                return const Center(
                  child: const Text('Can\'t load the image'),
                );
              },
            ),
          ),
          ListTile(
            title: Text(
              _picture.authorName.split(' ').length == 2
                  ? _picture.authorName.split(' ')[1]
                  : _picture.authorName.split(' ')[0],
            ),
            subtitle: _picture.authorName.split(' ').length == 2
                ? Text(_picture.authorName.split(' ')[0])
                : null,
            trailing: Text(
              '${_picture.width}x${_picture.height}',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Theme.of(context).textTheme.caption.color,
                  ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _progressIndicatorBuilder(DownloadProgress downloadProgress) {
    return const Center(
      child: const CircularProgressIndicator(strokeWidth: 1),
    );
  }
}
