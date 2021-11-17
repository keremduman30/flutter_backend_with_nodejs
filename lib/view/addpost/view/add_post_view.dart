import 'package:flutter/material.dart';
import 'package:tekrar/core/base/view/base_view.dart';
import 'package:tekrar/core/component/textformfield/text_form_field.dart';
import 'package:tekrar/core/extension/context_extension.dart';
import 'package:tekrar/core/extension/string_extension.dart';
import 'package:tekrar/core/init/language/locale_keys.g.dart';
import 'package:tekrar/view/addpost/view_model/add_post_view_model.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AddPostViewModel>(
      viewModel: AddPostViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, AddPostViewModel viewModel) => Scaffold(
          body: Padding(
        padding: context.paddingMedium,
        child: Column(
          children: [
            SizedBox(
              height: context.highPlus,
            ),
            TextFormFieldWidget(controller: viewModel.postTitle, label: LocaleKeys.addpostview_post_title.locale),
            SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(controller: viewModel.postExplain, label: LocaleKeys.addpostview_post_body.locale),
            SizedBox(
              height: context.normalPlus,
            ),
            Padding(
              padding: context.paddingMediumHorizontal,
              child: ElevatedButton(
                  onPressed: () {
                    viewModel.addPost();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey.withOpacity(0.6), side: BorderSide(color: Colors.white)),
                  child: Center(
                      child: Text(
                    LocaleKeys.addpostview_postButton.locale,
                    style: context.textThem.headline6?.copyWith(color: context.colors.background, fontSize: context.normalPlus),
                  ))),
            )
          ],
        ),
      )),
    );
  }
}
