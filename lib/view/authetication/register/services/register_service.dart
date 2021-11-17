import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tekrar/core/constant/enum/local_keys.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/core/network/network_manager.dart';

class RegisterService {
  final dio = NetworkManager.instance.dio;
  Future<bool> fetchRegister(String email, String password, String phone, String nameAndSurname) async {
    try {
      final response = await dio.post("/register", data: {"email": email, "nameAndSurname": nameAndSurname, "phone": phone, "password": password});

      if (response.data["success"]) {
        debugPrint("istek basarılı");
        await LocaleManager.instance.setBoolValue(LocalKeysPreferencesKeys.login, true);
        await LocaleManager.instance.setStringValue(LocalKeysPreferencesKeys.id, response.data["id"]);
        return true;
      } else {
        Get.snackbar("hata", response.data["message"]);
        return false;
      }
    } catch (e) {
      debugPrint("hata" + e.toString());
      Get.snackbar("hata", e.toString());

      return false;
    }
  }
}
