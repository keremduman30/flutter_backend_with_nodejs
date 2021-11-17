import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tekrar/core/base/view/base_view.dart';
import 'package:tekrar/core/extension/context_extension.dart';
import 'package:tekrar/core/init/theme/mycolors/my_colors.dart';
import 'package:tekrar/view/authetication/on_board/view_model/on_board_view_model.dart';
import 'package:tekrar/view/product/constant/network_image.dart';
import 'package:tekrar/view/product/widget/avatar.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
      viewModel: OnboardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnboardViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingMedium,
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(
                flex: 2,
                child: buildRowFooter(viewModel, context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageView(OnboardViewModel viewModel) {
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemCount: viewModel.onboardList.length,
      itemBuilder: (context, index) {
        return buildColumnBody(viewModel, index, context);
      },
    );
  }

  Column buildColumnBody(OnboardViewModel viewModel, int index, BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: buildSvgPicture(viewModel, index),
        ),
        buildColumnDescription(viewModel, index, context)
      ],
    );
  }

  SvgPicture buildSvgPicture(OnboardViewModel viewModel, int index) => SvgPicture.asset(viewModel.onboardList[index].imagePath);

  Column buildColumnDescription(OnboardViewModel viewModel, int index, BuildContext context) {
    return Column(
      children: [
        buildTextLocaleTitle(viewModel, index, context),
        buildTextLocaleDescription(viewModel, index),
      ],
    );
  }

  Text buildTextLocaleTitle(OnboardViewModel viewModel, int index, BuildContext context) => Text(
        viewModel.onboardList[index].tittle,
        style: context.textThem.headline6,
      );

  Text buildTextLocaleDescription(OnboardViewModel viewModel, int index) => Text(viewModel.onboardList[index].description);

  Row buildRowFooter(OnboardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildListViewCircle(viewModel),
        Expanded(child: Center(
          child: Observer(builder: (_) {
            return Visibility(
              visible: viewModel.isLoading,
              child: CircularProgressIndicator(),
            );
          }),
        )),
        buildFloatingActionbutton(viewModel, context)
      ],
    );
  }

  ListView buildListViewCircle(OnboardViewModel viewModel) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: viewModel.onboardList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Observer(builder: (_) {
          return OnBoardCircleAvatar(isSelected: index == viewModel.currentIndex);
        });
      },
    );
  }

  IconButton buildFloatingActionbutton(OnboardViewModel viewModel, BuildContext context) => IconButton(
        onPressed: () {
          viewModel.onboardCompleted();
        },
        icon: Container(
          padding: context.paddingHigh,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(NetworkImageConstant.onBoardFiinish),
            ),
          ),
        ),
      );
}
