// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_board_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardViewModel on _OnboardViewModelBase, Store {
  final _$currentIndexAtom = Atom(name: '_OnboardViewModelBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_OnboardViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_OnboardViewModelBaseActionController =
      ActionController(name: '_OnboardViewModelBase');

  @override
  void changeCurrentIndex(int value) {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.changeCurrentIndex');
    try {
      return super.changeCurrentIndex(value);
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading() {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.changeIsLoading');
    try {
      return super.changeIsLoading();
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
isLoading: ${isLoading}
    ''';
  }
}
