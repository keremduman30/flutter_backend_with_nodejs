import 'package:get/get.dart';
import 'package:tekrar/core/constant/enum/local_keys.dart';
import 'package:tekrar/core/constant/services/end_point.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/core/network/network_manager.dart';

class AddPostService {
  final dio = NetworkManager.instance.dio;
  final id=LocaleManager.instance.getStringValue(LocalKeysPreferencesKeys.id);
  Future<bool> fetchAddPost(String postTitle, String postExplain) async {
    try {
      final response = await dio.post(EndPointsConstants.ADD_POST_PATH, data: {"postTitle": postTitle, "postExplain": postExplain,"id":id},);
      // ignore: avoid_print
      print("try catched");
      if (response.data["success"]) {
        Get.snackbar("post create success", "basarılı");
        return true;
      } else {
        Get.snackbar("Mistake", response.data["message"]);
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
