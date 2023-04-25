// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on AppStoreBase, Store {
  late final _$isDarkModeAtom =
      Atom(name: 'AppStoreBase.isDarkMode', context: context);

  late final _$doRememberAtom =
      Atom(name: 'AppStoreBase.doRemember', context: context);

  late final _$setPasswordAsyncAction =
      AsyncAction('AppStoreBase.setPassword', context: context);

  @override
  Future<void> setPassword(String val, {bool isInitializing = false}) {
    return _$setPasswordAsyncAction
        .run(() => super.setPassword(val, isInitializing: isInitializing));
  }

  @override
  bool get doRemember {
    _$doRememberAtom.reportRead();
    return super.doRemember;
  }

  @override
  set doRemember(bool value) {
    _$doRememberAtom.reportWrite(value, super.doRemember, () {
      super.doRemember = value;
    });
  }

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'AppStoreBase.isLoading', context: context);

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

  late final _$isJobShowAllAtom =
      Atom(name: 'AppStoreBase.isJobShowAll', context: context);

  @override
  bool get isJobShowAll {
    _$isJobShowAllAtom.reportRead();
    return super.isJobShowAll;
  }

  @override
  set isJobShowAll(bool value) {
    _$isJobShowAllAtom.reportWrite(value, super.isJobShowAll, () {
      super.isJobShowAll = value;
    });
  }

  late final _$setDarkModeAsyncAction =
      AsyncAction('AppStoreBase.setDarkMode', context: context);

  @override
  Future<void> setDarkMode(bool aIsDarkMode) {
    return _$setDarkModeAsyncAction.run(() => super.setDarkMode(aIsDarkMode));
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  void setLoading(bool val) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setLoading');
    try {
      return super.setLoading(val);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setJobShowAll(bool val) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setJobShowAll');
    try {
      return super.setJobShowAll(val);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkMode: ${isDarkMode},
isLoading: ${isLoading},
token: ${token},
loginUserId: ${loginUserId},
isJobShowAll: ${isJobShowAll},
doRemember: ${doRemember},
    ''';
  }

  late final _$tokenAtom = Atom(name: 'AppStoreBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  late final _$loginUserIdAtom =
      Atom(name: 'AppStoreBase.loginUserId', context: context);

  @override
  String get loginUserId {
    _$loginUserIdAtom.reportRead();
    return super.loginUserId;
  }

  @override
  set loginUserId(String value) {
    _$loginUserIdAtom.reportWrite(value, super.loginUserId, () {
      super.loginUserId = value;
    });
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }
}
