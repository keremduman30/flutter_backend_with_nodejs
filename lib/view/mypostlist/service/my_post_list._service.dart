import 'package:tekrar/core/constant/enum/local_keys.dart';
import 'package:tekrar/core/constant/services/end_point.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/core/network/network_manager.dart';

class MyPostListService {
  final dio = NetworkManager.instance.dio;
  final userID = LocaleManager.instance.getStringValue(LocalKeysPreferencesKeys.id);

  Future<List<dynamic>?> allPostList() async {
    List<dynamic> myPostList = [];
    final response = await dio.post(EndPointsConstants.ALL_POST_LIST_PATH, data: {"id": userID});
    if (response.statusCode == 200 && response.data != null) {
      if (response.data["allPost"] is List) {
        myPostList = response.data["allPost"];
        return myPostList;
      }
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> userTake() async {
    final response = await dio.post(EndPointsConstants.ALL_POST_LIST_PATH, data: {"id": userID});
    if (response.data != null) {
      return response.data["userDeatils"];
    } else {
      return null;
    }
  }

  Future<bool?> deletePost(String deletePostID) async {
    final response = await dio.post(EndPointsConstants.DELETE_POST, data: {"id": deletePostID});
    if (response.data != null) {
      return true;
    } else {
      return null;
    }
  }

  Future<bool?> updatePost(String updatePostID, String title, String body) async {
    final response = await dio.post(EndPointsConstants.UPDATE_POST, data: {"id": updatePostID, "postTitle": title, "postExplain": body});
    if (response.data != null) {
      return true;
    } else {
      return null;
    }
  }
}
