import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  StorageService._internal();

  static final StorageService instance = StorageService._internal();

  Future<void> setEncrypted(String key, dynamic value) async {
    await FlutterSecureStorage().write(
      key: key,
      value: value,
    );
  }

  Future<dynamic> getEncrypted(String key, dynamic defaultValue) async {
    return await FlutterSecureStorage().read(key: key) ?? defaultValue;
  }

  Future<void> removeEncrypted(String key) async {
    await FlutterSecureStorage().delete(key: key);
  }

  Future<void> removeAllEncrypted() async {
    await FlutterSecureStorage().deleteAll();
  }
}
