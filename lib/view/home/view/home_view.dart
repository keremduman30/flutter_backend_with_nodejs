import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tekrar/core/base/view/base_view.dart';
import 'package:tekrar/view/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => Scaffold(
        body: Observer(builder: (_) {
          return viewModel.widgetList[viewModel.pageNumber];
        }),
        bottomNavigationBar: Observer(builder: (_) {
          return BottomNavigationBar(
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.add_alert), label: "post ekle"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "postlarım"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "profilim"),
            ],
            currentIndex: viewModel.pageNumber,
            onTap: (value) {
              viewModel.changePageNumber(value);
            },
          );
        }),
      ),
    );
  }
}
