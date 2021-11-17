import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tekrar/core/component/card/not_found_navigator_widget.dart';
import 'package:tekrar/core/constant/navigation/navigation_constant.dart';
import 'package:tekrar/view/authetication/login/view/login_view.dart';
import 'package:tekrar/view/authetication/register/view/register_view.dart';
import 'package:tekrar/view/home/view/home_view.dart';
import 'package:tekrar/view/userUpdate/view/user_update_view.dart';

class NavigationRoute {
  static NavigationRoute? _instace;
  static NavigationRoute get instance {
    return _instace ??= NavigationRoute._init();
  }

  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.loginView:
        return normalNavigate(const LoginView());
      case NavigationConstant.reigster:
        return normalNavigate(const RegisterView());
      case NavigationConstant.home:
        return normalNavigate(const HomeView());
      // case NavigationConstant.userDetay:
      //   return normalNavigate(const UserUpdateView());
      default:
        return normalNavigate(const NotFoundNavigatorWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
