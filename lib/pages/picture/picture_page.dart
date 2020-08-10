import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:urbetrack_flutter_challenge/models/picture.dart';

class PicturePage extends StatelessWidget {
  final Picture _picture;

  const PicturePage(this._picture, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: InteractiveViewer(
        maxScale: 2,
        child: AspectRatio(
          aspectRatio: _picture.width / _picture.height,
          child: CachedNetworkImage(
            imageUrl: _picture.imageUrl,
            fit: BoxFit.contain,
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
      ),
    );
  }

  Widget _progressIndicatorBuilder(DownloadProgress downloadProgress) {
    return const Center(
      child: const CircularProgressIndicator(strokeWidth: 1),
    );
  }
}
