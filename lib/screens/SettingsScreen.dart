import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';
import 'AccountPreferences.dart';
import 'AdvertisingDataScreen.dart';
import 'CommunicationsScreen.dart';
import 'DataPrivacyScreen.dart';
import 'SelectThemeScreen.dart';
import 'SignInSecurityScreen.dart';
import 'VisibilityScreen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.dividerColor,
      appBar: appBarCommon(context, "Settings", () {
        finish(context);
      }, action: [
        IconButton(
          onPressed: () {},
          icon: Icon(AntDesign.questioncircle, color: context.iconColor),
        ),
      ]),
      body: Container(
        color: context.scaffoldBackgroundColor,
        child: ListView(
          children: [
            rowComponent(Icons.support_agent, "Account preference",
                "Options for managing your account and experience on Find My CoFounder",
                () {
              AccountPreferences().launch(context);
            }),
            rowComponent(Fontisto.locked, "Sign in & security",
                "options and controls for signing in and keeping your account safe",
                () {
              SignInSecurityScreen().launch(context);
            }),
            rowComponent(Ionicons.eye, "Visibility",
                "Control who sees you activity and information on Find My CoFounder",
                () {
              VisibilityScreen().launch(context);
            }),
            rowComponent(Ionicons.ios_mail, "Communication",
                "Control for emails,invite, and notifications", () {
              CommunicationsScreen().launch(context);
            }),
            rowComponent(MaterialIcons.privacy_tip, "Data privacy",
                "Control how Find My CoFounder uses your information for general site use and job seeking",
                () {
              DataPrivacyScreen().launch(context);
            }),
            rowComponent(Icons.newspaper_outlined, "Advertise data",
                "Control how Find My CoFounder uses your information to serve you ads",
                () {
              AdvertisingDataScreen().launch(context);
            }),
            rowComponent(MaterialCommunityIcons.theme_light_dark, "Dark mode",
                "Control how linked looks when using this device", () {
              SelectThemeScreen().launch(context);
            }),
            textButtonComponent("Help Center", () {}),
            textButtonComponent("Privacy Policy", () {}),
            textButtonComponent("Accessibility", () {}),
            textButtonComponent("User Agreement", () {}),
            textButtonComponent("End USer License Agreement", () {}),
            textButtonComponent("Sign Out", () {}),
            FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Text('VERSION ${snap.data!.version.toString()}',
                          style: boldTextStyle(
                              size: 14, color: textSecondaryColorGlobal)),
                    );
                  }
                  return SizedBox();
                }),
          ],
        ),
      ),
    );
  }

  rowComponent(IconData icon, text, subtext, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              children: [
                Icon(icon, color: textSecondaryColorGlobal, size: 22),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text, style: boldTextStyle()),
                      Text(subtext,
                          style: secondaryTextStyle(
                              color: textSecondaryColorGlobal)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1)
        ],
      ),
    );
  }

  textButtonComponent(text, onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(text,
              style: boldTextStyle(size: 14, color: textSecondaryColorGlobal))),
    );
  }
}
