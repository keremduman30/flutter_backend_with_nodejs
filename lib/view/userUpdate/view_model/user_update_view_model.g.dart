// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserUpdateViewModel on _UserUpdateViewModelBase, Store {
  final _$emailValueAtom = Atom(name: '_UserUpdateViewModelBase.emailValue');

  @override
  String get emailValue {
    _$emailValueAtom.reportRead();
    return super.emailValue;
  }

  @override
  set emailValue(String value) {
    _$emailValueAtom.reportWrite(value, super.emailValue, () {
      super.emailValue = value;
    });
  }

  final _$phoneValue0Atom = Atom(name: '_UserUpdateViewModelBase.phoneValue0');

  @override
  String get phoneValue0 {
    _$phoneValue0Atom.reportRead();
    return super.phoneValue0;
  }

  @override
  set phoneValue0(String value) {
    _$phoneValue0Atom.reportWrite(value, super.phoneValue0, () {
      super.phoneValue0 = value;
    });
  }

  final _$nameAndSurnameValueAtom =
      Atom(name: '_UserUpdateViewModelBase.nameAndSurnameValue');

  @override
  String get nameAndSurnameValue {
    _$nameAndSurnameValueAtom.reportRead();
    return super.nameAndSurnameValue;
  }

  @override
  set nameAndSurnameValue(String value) {
    _$nameAndSurnameValueAtom.reportWrite(value, super.nameAndSurnameValue, () {
      super.nameAndSurnameValue = value;
    });
  }

  final _$userDetailsAtom = Atom(name: '_UserUpdateViewModelBase.userDetails');

  @override
  Map<String, dynamic>? get userDetails {
    _$userDetailsAtom.reportRead();
    return super.userDetails;
  }

  @override
  set userDetails(Map<String, dynamic>? value) {
    _$userDetailsAtom.reportWrite(value, super.userDetails, () {
      super.userDetails = value;
    });
  }

  final _$userDetailsInitializeAsyncAction =
      AsyncAction('_UserUpdateViewModelBase.userDetailsInitialize');

  @override
  Future<void> userDetailsInitialize() {
    return _$userDetailsInitializeAsyncAction
        .run(() => super.userDetailsInitialize());
  }

  final _$fillParametrsAsyncAction =
      AsyncAction('_UserUpdateViewModelBase.fillParametrs');

  @override
  Future<void> fillParametrs(String email, String ad, String phoneValue) {
    return _$fillParametrsAsyncAction
        .run(() => super.fillParametrs(email, ad, phoneValue));
  }

  @override
  String toString() {
    return '''
emailValue: ${emailValue},
phoneValue0: ${phoneValue0},
nameAndSurnameValue: ${nameAndSurnameValue},
userDetails: ${userDetails}
    ''';
  }
}
