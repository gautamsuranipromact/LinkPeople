import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:link_people/screens/SplashScreen.dart';
import 'package:link_people/store/AppStore.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/device_extensions.dart';
import 'package:link_people/utils/Extensions/shared_pref.dart';
import 'AppTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppStore appStore = AppStore();
Color defaultLoaderBgColorGlobal = Colors.white;
Color? defaultLoaderAccentColorGlobal;
int passwordLengthGlobal = 6;
final navigatorKey = GlobalKey<NavigatorState>();
late SharedPreferences sharedPreferences;

Future<void> initialize({
  double? defaultDialogBorderRadius,
  String? defaultLanguage,
}) async {
  sharedPreferences = await SharedPreferences.getInstance();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  if (!isWeb) {
    int themeModeIndex = getIntAsync(THEME_MODE_INDEX);
    if (themeModeIndex == appThemeMode.themeModeLight) {
      appStore.setDarkMode(false);
    } else if (themeModeIndex == appThemeMode.themeModeDark) {
      appStore.setDarkMode(true);
    }
  }
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
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appStore.isDarkMode ? darkScaffoldColor : secondaryColor.withOpacity(0.0), statusBarBrightness: appStore.isDarkMode ? Brightness.dark : Brightness.light));
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
        scrollBehavior: SBehavior(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: SplashScreen(),
      ),
    );
  }
}
