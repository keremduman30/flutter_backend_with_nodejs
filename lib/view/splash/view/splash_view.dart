import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tekrar/core/base/view/base_view.dart';
import 'package:tekrar/core/constant/app/image_constant.dart';
import 'package:tekrar/core/extension/context_extension.dart';
import 'package:tekrar/core/init/theme/mycolors/my_colors.dart';
import 'package:tekrar/view/splash/view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) => Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            splashImage(context),
            Spacer(),
            splahsFooter(context),
          ],
        )),
      ),
    );
  }

  Padding splahsFooter(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: Text(
        "kerem berwari",
        style: context.textThem.headline6!.copyWith(color: MyColors().grey6!.withOpacity(0.7), fontWeight: FontWeight.bold),
      ),
    );
  }

  Container splashImage(BuildContext context) {
    return Container(
      width: context.highPlus,
      height: context.highPlus,
      decoration: BoxDecoration(
        color: MyColors().grey3!.withOpacity(0.4),
        borderRadius: BorderRadius.all(Radius.circular(75)),
        image: DecorationImage(
          image: AssetImage(ImageConstant.instance.spash),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
