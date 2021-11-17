import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tekrar/core/constant/enum/local_keys.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/core/network/network_manager.dart';

class LoginServices {
  final dio = NetworkManager.instance.dio;

  Future<bool> fetchLogin(String email, String password) async {
    final response = await dio.post("/login", data: {"email": email, "password": password});
    if (response.data["success"]) {
      Get.snackbar("bilgi", response.data["message"]);
      await LocaleManager.instance.setBoolValue(LocalKeysPreferencesKeys.login, true);
      await LocaleManager.instance.setStringValue(LocalKeysPreferencesKeys.id, response.data["id"]);

      return true;
    } else {
      debugPrint("hata :  ${response.data["message"]}");
      Get.snackbar("hata", response.data["message"]);

      return false;
    }
  }
}
