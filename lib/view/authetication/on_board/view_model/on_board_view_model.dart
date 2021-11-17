import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tekrar/core/base/view_model/base_view_model.dart';
import 'package:tekrar/core/constant/enum/local_keys.dart';
import 'package:tekrar/core/constant/navigation/navigation_constant.dart';
import 'package:tekrar/core/extension/string_extension.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/core/init/language/locale_keys.g.dart';
import 'package:tekrar/view/authetication/on_board/model/on_board_model.dart';
import 'package:tekrar/view/product/constant/image_path_svg.dart';
part 'on_board_view_model.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store, BaseViewModel {
  List<OnboardModel> onboardList = [];
  @observable
  int currentIndex = 0;
  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    onboardList.add(OnboardModel(LocaleKeys.onboard_page1_title.locale, LocaleKeys.onboard_page1_des.locale, ImagePathSvg.instance.chatSvg));
    onboardList.add(OnboardModel(LocaleKeys.onboard_page2_title.locale, LocaleKeys.onboard_page2_des.locale, ImagePathSvg.instance.ast));
    onboardList.add(OnboardModel(LocaleKeys.onboard_page3_title.locale, LocaleKeys.onboard_page3_des.locale, ImagePathSvg.instance.relaxSvg));
  }

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  @action
  void changeIsLoading() {
    isLoading = !isLoading;
  }

  void onboardCompleted() async {
    changeIsLoading();
    await LocaleManager.instance.setBoolValue(LocalKeysPreferencesKeys.onBoard, true);
    changeIsLoading();
    navigationService.navigatorToPageClear(path: NavigationConstant.loginView);
  }
}
