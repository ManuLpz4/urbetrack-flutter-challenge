import 'package:flutter/foundation.dart';

class Picture {
  final String id;
  final String imageUrl;
  final String authorName;
  final int width;
  final int height;

  const Picture({
    @required this.id,
    @required this.imageUrl,
    @required this.authorName,
    @required this.width,
    @required this.height,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'],
      imageUrl: json['download_url'],
      authorName: json['author'],
      width: json['width'],
      height: json['height'],
    );
  }
}
