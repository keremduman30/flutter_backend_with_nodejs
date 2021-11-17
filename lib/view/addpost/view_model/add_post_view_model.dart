import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tekrar/core/base/view_model/base_view_model.dart';
import 'package:tekrar/view/addpost/service/add_post_service.dart';
part 'add_post_view_model.g.dart';

class AddPostViewModel = _AddPostViewModelBase with _$AddPostViewModel;

abstract class _AddPostViewModelBase with Store, BaseViewModel {
  late TextEditingController postTitle;
  late TextEditingController postExplain;
  late AddPostService _addPostService;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    postTitle = TextEditingController();
    postExplain = TextEditingController();
    _addPostService = AddPostService();
  }

  void addPost() async {
    bool isThereProblems = await _addPostService.fetchAddPost(postTitle.text, postExplain.text);
    if (isThereProblems) {
      postTitle.clear();
      postExplain.clear();
      // debugPrint("islem basarılı");
    }
  }
}
