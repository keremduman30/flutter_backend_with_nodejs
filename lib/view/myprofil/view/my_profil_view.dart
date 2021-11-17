import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tekrar/core/base/view/base_view.dart';
import 'package:tekrar/core/constant/enum/app_thema_enum.dart';
import 'package:tekrar/core/extension/context_extension.dart';
import 'package:tekrar/core/extension/string_extension.dart';
import 'package:tekrar/core/extension/widget_extension.dart';
import 'package:tekrar/core/init/language/language_manager.dart';
import 'package:tekrar/core/init/language/locale_keys.g.dart';
import 'package:tekrar/core/init/notifier/thema_notifier.dart';
import 'package:tekrar/view/myprofil/view_model/my_profil_view_model.dart';

class MyProfilView extends StatelessWidget {
  const MyProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MyProfilViewModel>(
      viewModel: MyProfilViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MyProfilViewModel viewModel) => Scaffold(
          body: CustomScrollView(
        slivers: [
          sliverApp(context),
          userDetailsCard(viewModel, context).toSliver,
          Container(padding: context.paddingLow, child: buildCardChangeTheme(context, viewModel)).toSliver,
          Container(
            padding: context.paddingLow,
            child: buildCardUserAbout(context, viewModel),
          ).toSliver,
          quitAppButton(context, viewModel).toSliver
        ],
      )),
    );
  }

  SliverAppBar sliverApp(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      backgroundColor: context.colors.background,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            LocaleKeys.my_profile_appar_title.locale,
            style: context.textThem.headline6!.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Card userDetailsCard(MyProfilViewModel viewModel, BuildContext context) {
    return Card(
      child: ListTile(
        leading: circleAvatarProfil(viewModel),
        title: userNameText(viewModel, context),
      ),
    );
  }

  Text userNameText(MyProfilViewModel viewModel, BuildContext context) {
    return Text(
      viewModel.user?["nameAndSurname"] ?? "",
      style: context.textThem.headline6,
    );
  }

  CircleAvatar circleAvatarProfil(MyProfilViewModel viewModel) {
    return CircleAvatar(
      child: Text(viewModel.user?["nameAndSurname"][0].toUpperCase() ?? ""),
    );
  }

  Widget buildCardChangeTheme(BuildContext context, MyProfilViewModel viewModel) {
    return buildCardHeader(context,
        array: [themeChangeTile(context, viewModel), languageChangeTile(context, viewModel)], title: LocaleKeys.my_profile_theme_change.locale);
  }

  ListTile languageChangeTile(BuildContext context, MyProfilViewModel viewModel) {
    return ListTile(
      leading: Icon(Icons.local_movies_outlined),
      title: Text(
        LocaleKeys.my_profile_language_change.locale,
        style: context.textThem.headline6,
      ),
      subtitle: Text(LocaleKeys.my_profile_language_information.locale),
      trailing: Observer(builder: (_) {
        return DropdownButton<Locale>(
          value: viewModel.appLocale,
          items: [
            dropDownMenuItemEn(),
            dropDownMenuItemTr(),
          ],
          onChanged: (value) {
            viewModel.changeLanguage(value);
          },
          style: context.textThem.headline6,
        );
      }),
    );
  }

  DropdownMenuItem<Locale> dropDownMenuItemTr() {
    return DropdownMenuItem(
      child: Text(
        LanguageManager.instance.trLocale.countryCode!.toUpperCase(),
      ),
      value: LanguageManager.instance.trLocale,
    );
  }

  DropdownMenuItem<Locale> dropDownMenuItemEn() {
    return DropdownMenuItem(
      child: Text(
        LanguageManager.instance.enLocale.countryCode!.toUpperCase(),
      ),
      value: LanguageManager.instance.enLocale,
    );
  }

  ListTile themeChangeTile(BuildContext context, MyProfilViewModel viewModel) {
    return ListTile(
      leading: Icon(Icons.local_movies_outlined),
      title: Text(LocaleKeys.my_profile_theme_change.locale, style: context.textThem.headline6!.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(LocaleKeys.my_profile_theme_information.locale),
      trailing: IconButton(
        icon: Icon(context.watch<ThemeNotifier>().appThemes == AppThemeEnum.DARK ? Icons.nightlight_round : Icons.wb_sunny),
        onPressed: () {
          viewModel.isCheckedChange();
          viewModel.changeTheme(context);
        },
      ),
    );
  }

  Widget buildCardUserAbout(BuildContext context, MyProfilViewModel viewModel) {
    return buildCardHeader(context,
        array: [
          ListTile(
            onTap: () {
              viewModel.updateLocalUser();
            },
            leading: Icon(Icons.person),
            title: Text(
              LocaleKeys.my_profile_update_information.locale,
              style: context.textThem.headline6!.copyWith(fontSize: 16),
            ),
            trailing: Icon(Icons.arrow_right_outlined),
          ),
        ],
        title: LocaleKeys.my_profile_user_about_title.locale);
  }

  TextButton quitAppButton(BuildContext context, MyProfilViewModel viewModel) {
    return TextButton.icon(
      style: TextButton.styleFrom(backgroundColor: context.colors.background),
      onPressed: () {
        viewModel.quitApp();
      },
      icon: Icon(Icons.arrow_right_rounded),
      label: Text(LocaleKeys.my_profile_quit_app.locale, style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold)),
    );
  }

  Widget buildCardHeader(BuildContext context, {required List<Widget> array, required String title}) {
    return Card(
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              " $title",
              style: context.textThem.headline6!.copyWith(color: Colors.black),
            ),
          ),
          Divider(),
          ...array
        ],
      ),
    );
  }
}
