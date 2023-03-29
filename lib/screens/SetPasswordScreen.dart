import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/AppTextField.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import '../main.dart';
import '../utils/AppImages.dart';
import 'DashboardScreen.dart';

class SetPasswordScreen extends StatefulWidget {
  @override
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
          title: Padding(
            padding: EdgeInsets.only(left: 0, top: 16),
            child: appStore.isDarkMode ? Image.asset(ic_logo_light, height: 15, fit: BoxFit.cover) : Image.asset(ic_logo, height: 15, fit: BoxFit.cover),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Set your password", style: primaryTextStyle(size: 30)),
                  SizedBox(height: 30),
                  AppTextField(textFieldType: TextFieldType.OTHER, decoration: InputDecoration(labelText: "Email or Phone*", labelStyle: secondaryTextStyle(), focusedBorder: UnderlineInputBorder())),
                  SizedBox(height: 20),
                  AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(labelText: "Password*", labelStyle: secondaryTextStyle(), helperText: "6 or more characters", focusedBorder: UnderlineInputBorder())),
                  SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text: "By clicking Agree & join, you agree to the LinkPeople ",
                      style: TextStyle(color: Colors.grey, fontSize: 14, letterSpacing: 0),
                      children: <InlineSpan>[
                        TextSpan(text: 'User Agreement ', style: TextStyle(fontSize: 14, color: primaryColor)),
                        TextSpan(text: ' , Privacy Policy ', style: TextStyle(fontSize: 14, color: primaryColor)),
                        TextSpan(text: ' and ', style: secondaryTextStyle()),
                        TextSpan(text: 'Cookie Policy.', style: secondaryTextStyle(color: primaryColor)),
                        TextSpan(text: 'For phone number signips we will send a verification code via SMS.'),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            appButton(context, "Agree & Join", onTap: () {
              DashboardScreen().launch(context);
            })
          ],
        ),
      ),
    );
  }
}
