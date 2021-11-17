import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:tekrar/core/base/view_model/base_view_model.dart';
import 'package:tekrar/core/constant/enum/app_thema_enum.dart';
import 'package:tekrar/core/constant/enum/local_keys.dart';
import 'package:tekrar/core/constant/navigation/navigation_constant.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/core/init/language/language_manager.dart';
import 'package:tekrar/core/init/notifier/thema_notifier.dart';
import 'package:tekrar/view/myprofil/service/my_profil_service.dart';
import 'package:tekrar/view/userUpdate/view/user_update_view.dart';
part 'my_profil.g.dart';

class MyProfilViewModel = _MyProfilViewModelBase with _$MyProfilViewModel;

abstract class _MyProfilViewModelBase with Store, BaseViewModel {
  late MyProfilService _service;

  @observable
  Map<String, dynamic>? user;

  @observable
  bool isChecked = false;

  @observable
  bool isLoading = false;

  //language de degisim için setlcale içine locale donduren bir degergirmek lazom
  @observable
  Locale? appLocale = LanguageManager.instance.enLocale;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _service = MyProfilService();
    localUser();
  }

   @action
  Future<void> localUser() async {
    final resultUser = await _service.userTake();
    if (resultUser != null) {
      user = resultUser;
      isLoading=true;
    }
    else{
      isLoading=false;
    }
  }

  void quitApp() async {
    await LocaleManager.instance.setBoolValue(LocalKeysPreferencesKeys.login, false);
    navigationService.navigatorToPageClear(path: NavigationConstant.loginView);
  }

  void isCheckedChange() {
    isChecked = !isChecked;
  }

  void changeTheme(BuildContext context) {
    if (isChecked) {
      context.read<ThemeNotifier>().changeValue(AppThemeEnum.DARK);
    } else {
      context.read<ThemeNotifier>().changeValue(AppThemeEnum.LIGHT);
    }
  }

  void updateLocalUser() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserUpdateView(
          userDetails: user,
        ),
      ),
    );
  }

  @action
  void changeLanguage(Locale? locale) {
    if (locale != null) {
      appLocale = locale;
      context.setLocale(appLocale!);
    }
  }

  @action
  void changeAppLocalization(Locale? locale) {
    if (locale != null) {
      appLocale = locale;
      context.setLocale(appLocale!);
    }
  }
 
}
