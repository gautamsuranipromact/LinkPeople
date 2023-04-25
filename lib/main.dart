import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:link_people/models/common_models.dart';
import 'package:link_people/screens/SplashScreen.dart';
import 'package:link_people/store/AppStore.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppTheme.dart';
import 'language/languages.dart';

AppStore appStore = AppStore();
late BaseLanguage language;
Color defaultLoaderBgColorGlobal = Colors.white;
Color? defaultLoaderAccentColorGlobal;
int passwordLengthGlobal = 6;
final navigatorKey = GlobalKey<NavigatorState>();
late SharedPreferences sharedPreferences;
late SharedPreferences prefs;
String currentPackageName = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize(aLocaleLanguageList: languageList());
  await Firebase.initializeApp();

  prefs = await SharedPreferences.getInstance();
  sharedPreferences = await SharedPreferences.getInstance();

/*  await OneSignal.shared.getDeviceState().then((deviceState) {
    print(deviceState!.jsonRepresentation());
    prefs.setString(
        SharePreferencesKey.ONE_SIGNAL_PLAYER_ID, deviceState.userId!);
    //setValue(SharePreferencesKey.ONE_SIGNAL_PLAYER_ID, status?.userId.validate());
  });*/
/* Chirag Changes
 if (!isWeb) {
    int themeModeIndex = getIntAsync(THEME_MODE_INDEX);
    if (themeModeIndex == appThemeMode.themeModeLight) {
      appStore.setDarkMode(false);
    } else if (themeModeIndex == appThemeMode.themeModeDark) {
      appStore.setDarkMode(true);
    }
  }*/
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: appStore.isDarkMode
            ? darkScaffoldColor
            : secondaryColor.withOpacity(0.0),
        statusBarBrightness:
            appStore.isDarkMode ? Brightness.dark : Brightness.light));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: AppName,
        debugShowCheckedModeBanner: false,
        //scrollBehavior: SBehavior(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: SplashScreen(),
      ),
    );
  }
}
