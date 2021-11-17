import 'package:flutter/material.dart';
import 'package:tekrar/core/base/view/base_view.dart';
import 'package:tekrar/core/extension/context_extension.dart';
import 'package:tekrar/core/extension/string_extension.dart';
import 'package:tekrar/core/init/language/locale_keys.g.dart';
import 'package:tekrar/view/userUpdate/view_model/user_update_view_model.dart';

class UserUpdateView extends StatelessWidget {
  final Map<String, dynamic>? userDetails;

  const UserUpdateView({Key? key, required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<UserUpdateViewModel>(
      viewModel: UserUpdateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, UserUpdateViewModel viewModel) => Scaffold(
        body: Form(
          key: viewModel.formKey,
          child: Padding(padding: context.paddingMedium, child: columnField(context, viewModel)),
        ),
      ),
    );
  }

  Column columnField(BuildContext context, UserUpdateViewModel viewModel) {
    viewModel.fillParametrs(userDetails?["email"], userDetails?["nameAndSurname"], userDetails?["phone"]);
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.normalValue),
          child: nameAndSurnameTextFormField(viewModel, context),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.normalValue),
          child: phoneTextFormField(viewModel, context),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.normalValue),
          child: emailControllerTextFormField(viewModel, context),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.normalValue),
          child: passwordTextFormField(viewModel, context),
        ),
        updateButton(viewModel, context),
      ],
    );
  }

  TextFormField passwordTextFormField(UserUpdateViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.passwordController,
      style: context.textThem.headline6,
      obscureText: true,
      decoration: InputDecoration(
        label: Text(LocaleKeys.register_password.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty.locale;
        }
      },
    );
  }

  TextFormField emailControllerTextFormField(UserUpdateViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.emailController,
      style: context.textThem.headline6,
      decoration: InputDecoration(
        label: Text(LocaleKeys.register_email.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty.locale;
        }
      },
    );
  }

  TextFormField phoneTextFormField(UserUpdateViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.phone,
      style: context.textThem.headline6,
      decoration: InputDecoration(
        label: Text(LocaleKeys.register_phone.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty.locale;
        }
      },
    );
  }

  TextFormField nameAndSurnameTextFormField(UserUpdateViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.nameAndSurname,
      style: context.textThem.headline6,
      decoration: InputDecoration(
        label: Text(LocaleKeys.register_nameAndSurname.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty.locale;
        }
      },
    );
  }

  Widget updateButton(UserUpdateViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: ElevatedButton(
          onPressed: () {
            viewModel.updateUserInformation();
          },
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey.withOpacity(0.6), side: BorderSide(color: Colors.white)),
          child: Center(
              child: Text(
            LocaleKeys.user_update_update.locale,
            style: context.textThem.headline6?.copyWith(color: context.colors.background, fontSize: context.normalPlus),
          ))),
    );
  }
}
