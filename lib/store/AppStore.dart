import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppConstants.dart';

/*
import 'package:link_people/main.dart';
import 'package:link_people/utils/Extensions/Colors.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
*/
part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isDarkMode = false;

  @observable
  bool isLoading = false;

  @observable
  String token = '';

  @observable
  String loginEmail = '';

  @observable
  String loginFullName = '';

  @observable
  String loginName = '';

  @observable
  String password = '';

  @observable
  String loginUserId = '';

  @observable
  String loginAvatarUrl = '';

  @observable
  bool isLoggedIn = false;

  @observable
  String nonce = '';

  @observable
  bool isJobShowAll = false;

  @observable
  bool doRemember = false;

  late final _$loginNameAtom =
      Atom(name: 'AppStoreBase.loginName', context: context);

  @action
  Future<void> setLoginName(String val, {bool isInitializing = false}) async {
    loginName = val;
    if (!isInitializing)
      await setValue(SharePreferencesKey.LOGIN_DISPLAY_NAME, val);
  }

  @action
  Future<void> setRemember(bool val, {bool isInitializing = false}) async {
    doRemember = val;
    if (!isInitializing) await setValue(SharePreferencesKey.REMEMBER_ME, val);
  }

  @action
  void setLoading(bool val) => isLoading = val;

  @action
  void setJobShowAll(bool val) => isJobShowAll = val;

  @action
  Future<void> setDarkMode(bool aIsDarkMode) async {
    isDarkMode = aIsDarkMode;

    if (isDarkMode) {
      textPrimaryColorGlobal = Colors.white;
      textSecondaryColorGlobal = viewLineColor;
      defaultLoaderBgColorGlobal = Colors.black26;
      defaultLoaderAccentColorGlobal = Colors.white;
      appButtonBackgroundColorGlobal = Colors.white;
      shadowColorGlobal = Colors.white12;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: darkScaffoldColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    } else {
      textPrimaryColorGlobal = textPrimaryColor;
      textSecondaryColorGlobal = textSecondaryColor;
      defaultLoaderBgColorGlobal = Colors.white;
      appButtonBackgroundColorGlobal = primaryColor;
      shadowColorGlobal = Colors.black12;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: secondaryColor.withOpacity(0.0),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light));
    }
  }

  @action
  Future<void> setNonce(String val, {bool isInitializing = false}) async {
    nonce = val;
    if (!isInitializing) await setValue(SharePreferencesKey.NONCE, '$val');
  }

  @action
  Future<void> setToken(String val, {bool isInitializing = false}) async {
    token = val;
    if (!isInitializing) await setValue(SharePreferencesKey.TOKEN, '$val');
  }

  @action
  Future<void> setLoggedIn(bool val, {bool isInitializing = false}) async {
    isLoggedIn = val;
    if (!isInitializing)
      await setValue(SharePreferencesKey.IS_LOGGED_IN, '$val');
  }

  @action
  Future<void> setLoginEmail(String val, {bool isInitializing = false}) async {
    loginEmail = val;
    if (!isInitializing) await setValue(SharePreferencesKey.LOGIN_EMAIL, val);
  }

  @action
  Future<void> setLoginFullName(String val,
      {bool isInitializing = false}) async {
    loginFullName = val;
    if (!isInitializing)
      await setValue(SharePreferencesKey.LOGIN_FULL_NAME, val);
  }

  @action
  Future<void> setPassword(String val, {bool isInitializing = false}) async {
    password = val;
    if (!isInitializing)
      await setValue(SharePreferencesKey.LOGIN_PASSWORD, val);
  }

  @action
  Future<void> setLoginUserId(String val, {bool isInitializing = false}) async {
    loginUserId = val;
    if (!isInitializing) await setValue(SharePreferencesKey.LOGIN_USER_ID, val);
  }

  @action
  Future<void> setLoginAvatarUrl(String val,
      {bool isInitializing = false}) async {
    loginAvatarUrl = val;
    if (!isInitializing)
      await setValue(SharePreferencesKey.LOGIN_AVATAR_URL, val);
  }
}
