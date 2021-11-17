import 'package:flutter/cupertino.dart';
import 'package:tekrar/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  late BuildContext context;
  void setContext(BuildContext context) => this.context = context;
  void init();
  NavigationService navigationService = NavigationService.instance;
}
