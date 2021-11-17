import 'package:get/get.dart';
import 'package:tekrar/core/constant/enum/local_keys.dart';
import 'package:tekrar/core/constant/services/end_point.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/core/network/network_manager.dart';

class UserUpdateService {
  final dio = NetworkManager.instance.dio;
  final activeId = LocaleManager.instance.getStringValue(LocalKeysPreferencesKeys.id);

  Future<bool?> updatefetch(String nameAndSurname, String phone, String email, String password) async {
    final response = await dio.post(
      EndPointsConstants.UPDATE_USER,
      data: {"id": activeId, "nameAndSurname": nameAndSurname, "email": email, "password": password},
    );
    if (response.data != null && response.data["success"]) {
      return true;
    } else {
      Get.snackbar("error", response.data["message"]);
      return null;
    }
  }

  Future<Map<String, dynamic>?> userTake() async {
    final response = await dio.post(EndPointsConstants.ALL_POST_LIST_PATH, data: {"id": activeId});
    if (response.data != null) {
      return response.data["userDeatils"];
    } else {
      return null;
    }
  }
}
