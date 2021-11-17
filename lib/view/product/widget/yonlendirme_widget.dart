import 'package:flutter/material.dart';
import 'package:tekrar/core/constant/enum/local_keys.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/view/authetication/login/view/login_view.dart';
import 'package:tekrar/view/authetication/on_board/view/on_board_view.dart';
import 'package:tekrar/view/splash/view/splash_view.dart';

class YonlendirmeWidget extends StatelessWidget {
  const YonlendirmeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoardState = LocaleManager.instance.getBoolValue(LocalKeysPreferencesKeys.onBoard);
    final isLogin = LocaleManager.instance.getBoolValue(LocalKeysPreferencesKeys.login);
    return Scaffold(
      body: onBoardState
          ? isLogin
              ? SplashView()
              : LoginView()
          : OnboardView(),
    );
  }
}
