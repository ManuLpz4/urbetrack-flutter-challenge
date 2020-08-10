import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:urbetrack_flutter_challenge/models/picture.dart';
import 'package:urbetrack_flutter_challenge/utils/constants.dart';

class PicturesService {
  PicturesService._internal();

  static final PicturesService instance = PicturesService._internal();

  Future<List<Picture>> fetchPictures() async {
    List<Picture> pictures;

    try {
      final http.Response response = await http.get('$apiBaseUrl/api.json');
      switch (response.statusCode) {
        case 200:
          {
            final Iterable<dynamic> list = json.decode(response.body);
            pictures = list.map((e) => Picture.fromJson(e)).toList();
            break;
          }
      }
    } catch (e) {
      throw Exception(e);
    }

    return pictures;
  }
}
