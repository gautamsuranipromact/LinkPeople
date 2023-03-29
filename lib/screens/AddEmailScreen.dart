import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/int_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../main.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/decorations.dart';
import 'SetPasswordScreen.dart';

class AddEmailScreen extends StatefulWidget {
  final bool? isSignIn;

  AddEmailScreen({this.isSignIn = false});

  @override
  _AddEmailScreenState createState() => _AddEmailScreenState();
}

class _AddEmailScreenState extends State<AddEmailScreen> {
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
      appBar: AppBar(
          backgroundColor: context.scaffoldBackgroundColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Padding(padding: EdgeInsets.only(left: 0, top: 16), child: appStore.isDarkMode ? Image.asset(ic_logo_light, height: 15, fit: BoxFit.cover) : Image.asset(ic_logo, height: 15, fit: BoxFit.cover),)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.isSignIn == true ? "Join LinkPeople" : "Add your email or phone", style: primaryTextStyle(size: 30)),
                Visibility(
                  visible: widget.isSignIn == true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      GestureDetector(
                          onTap: () {
                            finish(context);
                          },
                          child: Text("Or sign in", style: boldTextStyle(size: 14, color: primaryColor))),
                    ],
                  ),
                ),
                SizedBox(height: widget.isSignIn == true ? 20 : 30),
                TextFormField(decoration: InputDecoration(labelText: "Email or Phone*", labelStyle: secondaryTextStyle(), focusedBorder: UnderlineInputBorder())),
                SizedBox(height: 30),
              ],
            ),
          ),
          appButton(context, "Continue", onTap: () {
            SetPasswordScreen().launch(context);
          }),
          12.height,
          Row(
            children: [
              Divider(indent: 10, endIndent: 20, thickness: 1).expand(),
              Text('Or', style: secondaryTextStyle()),
              Divider(indent: 20, endIndent: 10, thickness: 1).expand(),
            ],
          ),
          12.height,
          Container(
            alignment: Alignment.center,
            height: 45,
            width: context.width(),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: boxDecorationWithShadowWidget(
                backgroundColor: context.scaffoldBackgroundColor, borderRadius: radius(30), blurRadius: 0, spreadRadius: 0, border: Border.all(width: 1, color: textSecondaryColorGlobal)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ic_google, height: 25, width: 25, fit: BoxFit.cover),
                8.width,
                Text('Continue with Google', style: boldTextStyle()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
