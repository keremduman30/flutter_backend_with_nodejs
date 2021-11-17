// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tekrar/core/base/view_model/base_view_model.dart';
import 'package:tekrar/core/constant/navigation/navigation_constant.dart';
import 'package:tekrar/view/authetication/register/services/register_service.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameAndSurname;
  late TextEditingController phone;
  late RegisterService _service;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameAndSurname = TextEditingController();
    phone = TextEditingController();
    _service = RegisterService();
  }

  void registerController() async {
    bool isThereProblems = formKey.currentState!.validate();
    if (isThereProblems) {
      bool isServicesResponse = await _service.fetchRegister(emailController.text, passwordController.text, phone.text, nameAndSurname.text);
      debugPrint("await girdi");

      if (isServicesResponse) {
        navigationService.navigatorToPageClear(path: NavigationConstant.home);
      }
    }
  }
}
