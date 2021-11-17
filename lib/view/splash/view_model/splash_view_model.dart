import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tekrar/core/base/view_model/base_view_model.dart';
import 'package:tekrar/core/constant/navigation/navigation_constant.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    Future.delayed(Duration(seconds: 2)).then((value) => navigationService.navigatorToPageClear(path: NavigationConstant.home));
  }
}
