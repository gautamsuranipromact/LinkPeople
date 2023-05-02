import 'dart:async';

import 'package:flutter/material.dart';
import 'package:link_people/main.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';

import 'WalkThroughScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    Timer(Duration(seconds: 2), () {
      String? userId = prefs.getString(SharePreferencesKey.USERID);
      if (userId != null) {
        if (userId.isNotEmpty) {
          DashboardScreen().launch(context, isNewTask: true);
        } else {
          WalkThroughScreen().launch(context, isNewTask: true);
        }
      } else {
        WalkThroughScreen().launch(context, isNewTask: true);
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
            backgroundImage: AssetImage(ic_appLogo), maxRadius: 75),
      ),
    );
  }
}
