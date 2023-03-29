import 'dart:async';
import 'package:flutter/material.dart';
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
      WalkThroughScreen().launch(context, isNewTask: true);
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
        child: CircleAvatar(backgroundImage: AssetImage(ic_appLogo), maxRadius: 75),
      ),
    );
  }
}
