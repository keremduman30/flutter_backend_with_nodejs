import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tekrar/core/base/view_model/base_view_model.dart';
import 'package:tekrar/view/addpost/view/add_post_view.dart';
import 'package:tekrar/view/mypostlist/view/my_post_list_view.dart';
import 'package:tekrar/view/myprofil/view/my_profil_view.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  List<Widget> widgetList = [AddPostView(), MyPostListView(), MyProfilView()];
  @override
  @observable
  // ignore: override_on_non_overriding_member
  int pageNumber = 0;
  @action
  void changePageNumber(int value) {
    pageNumber = value;
  }

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
