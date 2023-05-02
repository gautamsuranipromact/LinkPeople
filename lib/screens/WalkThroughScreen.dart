import 'package:flutter/material.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/int_extensions.dart';

import '../main.dart';
import '../utils/AppCommon.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';
import 'JoinNowScreen.dart';
import 'SignInScreen.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  int? currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: context.scaffoldBackgroundColor,
          elevation: 0.0,
          automaticallyImplyLeading: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 100),
          appStore.isDarkMode
              ? Image.asset(ic_logo_light, height: 65, fit: BoxFit.cover)
              : Image.asset(ic_logo, height: 65, fit: BoxFit.cover),
          SizedBox(height: 80),
          Text('Join a trusted community of 800M professionals',
              style: boldTextStyle(size: 22), textAlign: TextAlign.center),
          SizedBox(height: 100),
          Column(
            children: [
              appButton(context, 'Join now', onTap: () {
                JoinNowScreen().launch(context);
              }),
              /*Container(
                alignment: Alignment.center,
                height: 45,
                width: context.width(),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: context.scaffoldBackgroundColor,
                    borderRadius: radius(30),
                    border: Border.all(width: 0.5)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ic_google,
                        height: 25, width: 25, fit: BoxFit.cover),
                    8.width,
                    Text('Continue with Google',
                        style: boldTextStyle(color: textSecondaryColorGlobal)),
                  ],
                ),
              ),*/
              TextButton(
                  onPressed: () {
                    SignInScreen().launch(context);
                  },
                  child: Text('Sign in',
                      style: boldTextStyle(color: primaryColor, size: 18))),
            ],
          ),
        ],
      ),
    );
  }
}
