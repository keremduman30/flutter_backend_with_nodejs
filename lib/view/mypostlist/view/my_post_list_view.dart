// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tekrar/core/base/view/base_view.dart';
import 'package:tekrar/core/extension/context_extension.dart';
import 'package:tekrar/core/extension/string_extension.dart';
import 'package:tekrar/core/init/language/locale_keys.g.dart';
import 'package:tekrar/core/init/theme/mycolors/my_colors.dart';
import 'package:tekrar/view/mypostlist/view_model/my_post_list_view_model.dart';
import 'package:tekrar/view/product/widget/alert_dialog.dart';

class MyPostListView extends StatelessWidget {
  const MyPostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MyPostListViewModel>(
      viewModel: MyPostListViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MyPostListViewModel viewModel) => Scaffold(body: Observer(builder: (_) {
        return viewModel.isLoad
            ? viewModel.postList!.isNotEmpty
                ? ListView.builder(
                    itemCount: viewModel.postList?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return postListCard(viewModel, context, index);
                    },
                  )
                : Center(child: Text("Herhangi bir notunuz bulunmamaktadır"))
            : Center(child: CircularProgressIndicator());
      })),
    );
  }

  SizedBox postListCard(MyPostListViewModel viewModel, BuildContext context, int index) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    circleAvatarNameProfil(viewModel),
                    SizedBox(
                      width: context.lowValue,
                    ),
                    Text(viewModel.user?["nameAndSurname"] ?? "keremB"),
                    Spacer(),
                    popupMenuButton(context, viewModel, index)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  viewModel.postList?[index]["postTitle"] ?? "null baslık",
                  style: context.textThem.headline6,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: AutoSizeText(
                    viewModel.postList?[index]["postExplain"] ?? "post explain",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CircleAvatar circleAvatarNameProfil(MyPostListViewModel viewModel) {
    return CircleAvatar(
      child: Text(viewModel.user!["nameAndSurname"][0].toUpperCase()),
    );
  }

  PopupMenuButton<int> popupMenuButton(BuildContext context, MyPostListViewModel viewModel, int index) {
    return PopupMenuButton(
      child: Padding(
        padding: context.paddingNormal,
        child: Icon(
          Icons.more_vert,
          size: context.mediumValue,
        ),
      ),
      itemBuilder: (context) => [
        popMenuItemDelete(context),
        popMenuItemUpdate(context),
      ],
      onSelected: (value) {
        if (value == 1) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey[600],
            content: Text('bu notu silmek istediginizden emin misiniz ?'),
            action: SnackBarAction(
              label: 'Evet',
              textColor: MyColors().cyan,
              onPressed: () {
                viewModel.deletePost(viewModel.postList![index]["_id"]);
              },
            ),
          ));
        }
        if (value == 2) {
          updatePost(context, viewModel, index);
        }
      },
    );
  }

  PopupMenuItem<int> popMenuItemUpdate(BuildContext context) {
    return PopupMenuItem(
      child: Text("guncele", style: context.textThem.headline6),
      value: 2,
    );
  }

  PopupMenuItem<int> popMenuItemDelete(BuildContext context) {
    return PopupMenuItem(
      child: Text(
        "sil",
        style: context.textThem.headline6,
      ),
      value: 1,
    );
  }

  Future<dynamic> updatePost(BuildContext context, MyPostListViewModel viewModel, int index) {
    viewModel.changeValuePostEdit(viewModel.postList![index]["postTitle"], viewModel.postList![index]["postExplain"]);
    return showDialog(
        context: context,
        builder: (context) {
          return Form(
            key: viewModel.formKey,
            child: AlertDialogWidget(
              postTitle: viewModel.postTitle,
              postBody: viewModel.postBody,
              array: [
                Padding(
                  padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
                  child: postTitleField(viewModel, context),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                  child: postBodyField(viewModel, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    cancelTextButton(context),
                    updateTextButton(viewModel, index, context),
                  ],
                )
              ],
            ),
          );
        });
  }

  TextButton cancelTextButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "İptal",
          style: context.textThem.headline6!.copyWith(color: context.colors.secondary, fontSize: 16),
        ));
  }

  TextButton updateTextButton(MyPostListViewModel viewModel, int index, BuildContext context) {
    return TextButton(
        onPressed: () {
          viewModel.updatePost(viewModel.postList![index]["_id"]);
          Navigator.pop(context);
        },
        child: Text(
          "Tamam",
          style: context.textThem.headline6!.copyWith(color: context.colors.secondary, fontSize: 16),
        ));
  }

  TextFormField postBodyField(MyPostListViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.postBody,
      style: context.textThem.headline6!.copyWith(fontSize: 16),
      decoration: InputDecoration(
        label: Text(LocaleKeys.addpostview_post_body.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty.locale;
        }
      },
    );
  }

  TextFormField postTitleField(MyPostListViewModel viewModel, BuildContext context) {
    return TextFormField(
      controller: viewModel.postTitle,
      style: context.textThem.headline6!.copyWith(fontSize: 16),
      decoration: InputDecoration(
        label: Text(LocaleKeys.addpostview_post_title.locale),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.register_isEmpty.locale;
        }
      },
    );
  }
}
