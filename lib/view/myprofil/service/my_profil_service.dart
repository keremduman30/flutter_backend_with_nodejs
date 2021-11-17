import 'package:tekrar/core/constant/enum/local_keys.dart';
import 'package:tekrar/core/constant/services/end_point.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/core/network/network_manager.dart';

class MyProfilService{
  final dio=NetworkManager.instance.dio;
  final id=LocaleManager.instance.getStringValue(LocalKeysPreferencesKeys.id);
  Future<Map<String, dynamic>?> userTake() async {
    final response = await dio.post(EndPointsConstants.ALL_POST_LIST_PATH, data: {"id": id});
    if (response.data != null) {
      return response.data["userDeatils"];
    } else {
      return null;
    }
  }
}