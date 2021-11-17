import 'package:flutter/material.dart';
import 'package:tekrar/core/base/view/base_view.dart';
import 'package:tekrar/core/constant/navigation/navigation_constant.dart';
import 'package:tekrar/core/extension/context_extension.dart';
import 'package:tekrar/core/init/navigation/navigation_service.dart';
import 'package:tekrar/view/authetication/login/view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) => Scaffold(
        appBar: AppBar(
          title: Text(
            "login page",
            style: context.textThem.headline6!.copyWith(color: context.colors.onSecondary),
          ),
        ),
        body: Form(
          key: viewModel.formKey,
          child: Padding(
            padding: context.paddingNormalPlus,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                emailTextFormField(viewModel, context),
                SizedBox(
                  height: 25,
                ),
                passwordTextFormField(viewModel, context),
                SizedBox(
                  height: 10,
                ),
                loginButton(viewModel, context),
                registerAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector registerAccountText() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigatorToPage(path: NavigationConstant.reigster);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text("dont have a account ? be register"),
      ),
    );
  }

  ElevatedButton loginButton(LoginViewModel viewModel, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        viewModel.loginController();
      },
      child: Center(
          child: Text(
        'Login',
        style: context.textBlackColor,
      )),
      style: ElevatedButton.styleFrom(primary: context.colors.onError, shape: StadiumBorder()),
    );
  }

  TextFormField passwordTextFormField(LoginViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.passwordController,
      style: context.textThem.headline6,
      obscureText: true,
      decoration: InputDecoration(label: Text("password")),
      validator: (value) {
        if (value!.isEmpty) {
          return "lütfen bos bırakma";
        }
      },
    );
  }

  TextFormField emailTextFormField(LoginViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.emailController,
      style: context.textThem.headline6,
      decoration: InputDecoration(label: Text("email")),
      validator: (value) {
        if (value!.isEmpty) {
          return "lütfen bos bırakma";
        }
      },
    );
  }
}
