import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:tekrar/core/base/view_model/base_view_model.dart';
import 'package:tekrar/view/mypostlist/service/my_post_list._service.dart';
part 'my_post_list_view_model.g.dart';

class MyPostListViewModel = _MyPostListViewModelBase with _$MyPostListViewModel;

abstract class _MyPostListViewModelBase with Store, BaseViewModel {
  late MyPostListService _myPostListService;
  late TextEditingController postTitle;
  late TextEditingController postBody;
  GlobalKey<FormState> formKey = GlobalKey();
  @observable
  bool isLoad = false;

  @observable
  List<dynamic>? postList;
  @observable
  Map<String, dynamic>? user;

  @observable
  String postTitleValue = "";
  String postBodyValue = "";

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _myPostListService = MyPostListService();
    allPostList();
    postTitle = TextEditingController();
    postBody = TextEditingController();
  }

  @action
  Future<void> allPostList() async {
    final resultPostList = await _myPostListService.allPostList();
    if (resultPostList != null) {
      await localUser();
      postList = resultPostList;
      isLoad = true;
    } else {
      isLoad = false;
    }
  }
    
  @action
  Future<void> localUser() async {
    final resultUser = await _myPostListService.userTake();
    if (resultUser != null) {
      user = resultUser;
    }
  }

  Future<void> deletePost(String postId) async {
    final resultDeletePost = await _myPostListService.deletePost(postId);
    if (resultDeletePost != null) {
      Get.snackbar("Bilgi", "Silme işlemi Basarılı");
      allPostList();
    }
  }

  Future<void> updatePost(String id) async {
    final isThereProblems = formKey.currentState!.validate();
    final resultUpdate = await _myPostListService.updatePost(id, postTitle.text, postBody.text);
    if (isThereProblems) {
      if (resultUpdate != null) {
        Get.snackbar("Bilgi", "Guncelleme işlemi Basarılı");
        allPostList();
      }
    }
  }

  @action
  void changeValuePostEdit(String title, String body) {
    postTitleValue = title;
    postBodyValue = body;
    postTitle.text = postTitleValue;
    postBody.text = postBodyValue;
  }
}
