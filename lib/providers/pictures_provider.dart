import 'package:flutter/material.dart';

import 'package:urbetrack_flutter_challenge/models/picture.dart';
import 'package:urbetrack_flutter_challenge/services/pictures_service.dart';

class PicturesProvider with ChangeNotifier {
  List<Picture> _pictures;

  PicturesProvider() {
    fetchPictures();
  }

  List<Picture> get pictures => _pictures;

  Future<void> fetchPictures() async {
    try {
      _pictures = await PicturesService.instance.fetchPictures();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
