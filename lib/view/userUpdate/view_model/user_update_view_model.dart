// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tekrar/core/base/view_model/base_view_model.dart';
import 'package:tekrar/view/userUpdate/service/user_update_service.dart';
part 'user_update_view_model.g.dart';

class UserUpdateViewModel = _UserUpdateViewModelBase with _$UserUpdateViewModel;

abstract class _UserUpdateViewModelBase with Store, BaseViewModel {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameAndSurname;
  late TextEditingController phone;
  late UserUpdateService _service;

  @observable
  String emailValue = "";
  @observable
  String phoneValue0 = "";
  @observable
  String nameAndSurnameValue = "";

  @observable
  Map<String, dynamic>? userDetails;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameAndSurname = TextEditingController();
    phone = TextEditingController();
    _service = UserUpdateService();

    userDetailsInitialize();
  }

  void updateUserInformation() async {
    final isThereProblems = formKey.currentState!.validate();
    if (isThereProblems) {
      final resultUpdate = await _service.updatefetch(nameAndSurname.text, phone.text, emailController.text, passwordController.text);
      if (resultUpdate != null) {
        Navigator.pop(context);
      }
    }
  }

  @action
  Future<void> userDetailsInitialize() async {
    final resultUserDetails = await _service.userTake();
    if (resultUserDetails != null) {
      userDetails = resultUserDetails;
    }
  }

  @action
  Future<void> fillParametrs(String email, String ad, String phoneValue) async {
    emailValue = email;
    nameAndSurnameValue = ad;
    phoneValue0 = phoneValue;
    emailController.text = emailValue;
    phone.text = phoneValue0;
    nameAndSurname.text = nameAndSurnameValue;
    userDetailsInitialize();
  }
}
