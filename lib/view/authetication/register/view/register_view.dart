import 'package:flutter/material.dart';
import 'package:tekrar/core/base/view/base_view.dart';
import 'package:tekrar/core/extension/context_extension.dart';
import 'package:tekrar/core/extension/string_extension.dart';
import 'package:tekrar/core/init/language/locale_keys.g.dart';
import 'package:tekrar/view/authetication/register/view_model/register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RegisterViewModel viewModel) => Scaffold(
        resizeToAvoidBottomInset: false, //bu klavte acılınca asagı sekmeye ugramasın ama kullanıcı kaydırsın dedin
        appBar: AppBar(
          title: Text(
            LocaleKeys.register_title.locale,
            style: context.textThem.headline6?.copyWith(color: context.colors.onSecondary),
          ),
        ),
        body: SafeArea(
          child: Form(
            key: viewModel.formKey,
            child: Padding(
              padding: context.paddingMedium,
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: context.lowDuration,
                    height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.05, //klavye acılmasından kaynaklanan hatadan dolayı
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
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
                  registerButton(viewModel, context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton registerButton(RegisterViewModel viewModel, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        viewModel.registerController();
      },
      child: Center(
          child: Text(
        LocaleKeys.register_registerButton.locale,
        style: context.textBlackColor,
      )),
      style: ElevatedButton.styleFrom(primary: context.colors.onError, shape: StadiumBorder()),
    );
  }

  TextFormField passwordTextFormField(RegisterViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.passwordController,
      style: context.textThem.headline6,
      obscureText: true,
      decoration: InputDecoration(
        label: Text(LocaleKeys.register_password.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty;
        }
      },
    );
  }

  TextFormField emailControllerTextFormField(RegisterViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.emailController,
      style: context.textThem.headline6,
      decoration: InputDecoration(
        label: Text(LocaleKeys.register_email.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty;
        }
      },
    );
  }

  TextFormField phoneTextFormField(RegisterViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.phone,
      style: context.textThem.headline6,
      decoration: InputDecoration(
        label: Text(LocaleKeys.register_phone.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty;
        }
      },
    );
  }

  TextFormField nameAndSurnameTextFormField(RegisterViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.nameAndSurname,
      style: context.textThem.headline6,
      decoration: InputDecoration(
        label: Text(LocaleKeys.register_nameAndSurname.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty;
        }
      },
    );
  }
}
