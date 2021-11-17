import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tekrar/core/base/view_model/base_view_model.dart';
import 'package:tekrar/core/constant/navigation/navigation_constant.dart';
import 'package:tekrar/view/authetication/login/service/login_services.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late LoginServices _services;
  GlobalKey<FormState> formKey = GlobalKey();
 
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _services = LoginServices();
  }

  void loginController() async {
    bool isThereProblems = formKey.currentState!.validate();
    if (isThereProblems) {
      final servicesProblems = await _services.fetchLogin(emailController.text, passwordController.text);
      if (servicesProblems) {
        navigationService.navigatorToPageClear(path: NavigationConstant.home);
      }
    }
  }
}

