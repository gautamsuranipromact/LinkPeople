import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../main.dart';
import '../utils/AppCommon.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/text_styles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: context.scaffoldBackgroundColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Padding(padding: EdgeInsets.only(left: 0, top: 16), child: appStore.isDarkMode ? Image.asset(ic_logo_light, height: 15, fit: BoxFit.cover) : Image.asset(ic_logo, height: 15, fit: BoxFit.cover),)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text("Forgot Password?", style: boldTextStyle(size: 35)),
                  Text("Reset password in two quick steps", style: secondaryTextStyle()),
                  SizedBox(height: 30),
                  TextFormField(decoration: InputDecoration(hintText: "Email or phone")),
                  SizedBox(height: 30),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                //   AddEmailScreen().launch(context);
              },
              child: appButton(context, 'Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
