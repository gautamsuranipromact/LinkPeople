import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/Extensions/Colors.dart';
import '../utils/Extensions/Constants.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isDarkMode = false;

  @observable
  bool isLoading = false;

  @observable
  bool isJobShowAll = false;

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
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: secondaryColor.withOpacity(0.0), statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.light));
    }
  }
}
