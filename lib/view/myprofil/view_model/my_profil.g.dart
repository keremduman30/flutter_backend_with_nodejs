// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_profil_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyProfilViewModel on _MyProfilViewModelBase, Store {
  final _$userDetailsAtom = Atom(name: '_MyProfilViewModelBase.userDetails');

  @override
  Map<String, dynamic>? get user {
    _$userDetailsAtom.reportRead();
    return super.user;
  }

  @override
  set user(Map<String, dynamic>? value) {
    _$userDetailsAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$userDetailsFetchAsyncAction =
      AsyncAction('_MyProfilViewModelBase.userDetailsFetch');

  @override
  Future<void> localUser() {
    return _$userDetailsFetchAsyncAction.run(() => super.localUser());
  }

  @override
  String toString() {
    return '''
userDetails: ${user}
    ''';
  }
}
