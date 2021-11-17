// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_post_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyPostListViewModel on _MyPostListViewModelBase, Store {
  final _$isLoadAtom = Atom(name: '_MyPostListViewModelBase.isLoad');

  @override
  bool get isLoad {
    _$isLoadAtom.reportRead();
    return super.isLoad;
  }

  @override
  set isLoad(bool value) {
    _$isLoadAtom.reportWrite(value, super.isLoad, () {
      super.isLoad = value;
    });
  }

  final _$postListAtom = Atom(name: '_MyPostListViewModelBase.postList');

  @override
  List<dynamic>? get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(List<dynamic>? value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  final _$userAtom = Atom(name: '_MyPostListViewModelBase.user');

  @override
  Map<String, dynamic>? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Map<String, dynamic>? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$postTitleValueAtom =
      Atom(name: '_MyPostListViewModelBase.postTitleValue');

  @override
  String get postTitleValue {
    _$postTitleValueAtom.reportRead();
    return super.postTitleValue;
  }

  @override
  set postTitleValue(String value) {
    _$postTitleValueAtom.reportWrite(value, super.postTitleValue, () {
      super.postTitleValue = value;
    });
  }

  final _$allPostListAsyncAction =
      AsyncAction('_MyPostListViewModelBase.allPostList');

  @override
  Future<void> allPostList() {
    return _$allPostListAsyncAction.run(() => super.allPostList());
  }

  final _$localUserAsyncAction =
      AsyncAction('_MyPostListViewModelBase.localUser');

  @override
  Future<void> localUser() {
    return _$localUserAsyncAction.run(() => super.localUser());
  }

  final _$_MyPostListViewModelBaseActionController =
      ActionController(name: '_MyPostListViewModelBase');

  @override
  void changeValuePostEdit(String title, String body) {
    final _$actionInfo = _$_MyPostListViewModelBaseActionController.startAction(
        name: '_MyPostListViewModelBase.changeValuePostEdit');
    try {
      return super.changeValuePostEdit(title, body);
    } finally {
      _$_MyPostListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoad: ${isLoad},
postList: ${postList},
user: ${user},
postTitleValue: ${postTitleValue}
    ''';
  }
}
