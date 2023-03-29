import 'package:flutter/material.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/int_extensions.dart';
import 'package:link_people/utils/Extensions/string_extensions.dart';
import '../main.dart';
import '../utils/AppCommon.dart';
import '../utils/AppImages.dart';
import '../utils/AppWidget.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';
import 'AddEmailScreen.dart';
import 'ForgotPasswordScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();

  FocusNode passFocus = FocusNode();

  bool isRemember = false;

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
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: TextButton(
                onPressed: () {
                  AddEmailScreen(isSignIn: true).launch(context);
                },
                child: Text('Join now', style: primaryTextStyle(color: primaryColor))),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text('Sign in', style: boldTextStyle(size: 28)),
                10.height,
                AppTextField(
                  controller: emailCon,
                  nextFocus: passFocus,
                  autoFocus: false,
                  textFieldType: TextFieldType.EMAIL,
                  keyboardType: TextInputType.emailAddress,
                  errorThisFieldRequired: errorThisFieldRequired,
                  decoration: inputDecoration(context, label: "Email or Phone"),
                ),
                16.height,
                AppTextField(
                  controller: passCon,
                  focus: passFocus,
                  textFieldType: TextFieldType.PASSWORD,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    if (value.validate().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                  decoration: inputDecoration(context, label: "Password"),
                  onFieldSubmitted: (c) {},
                ),
                20.height,
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CustomTheme(
                child: Checkbox(
                  focusColor: primaryColor,
                  activeColor: greenColor,
                  value: isRemember,
                  onChanged: (bool? value) async {
                    isRemember = !isRemember;
                    setState(() {});
                  },
                ),
              ),
              Text("Remember me.", style: secondaryTextStyle(size: 16)),
              4.width,
              Text('Learn More', style: boldTextStyle(color: primaryColor, size: 14)),
            ],
          ),
          20.height,
          GestureDetector(
              onTap: () {
                ForgotPasswordScreen().launch(context);
              },
              child: Text('Forgot Password?', style: boldTextStyle(color: primaryColor, size: 14)).paddingSymmetric(horizontal: 16)),
          8.height,
          appButton(context, 'Continue', onTap: () {
            DashboardScreen().launch(context);
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
                Text('Sign in with Google', style: boldTextStyle()),
              ],
            ),
          ),
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
                Icon(Icons.apple),
                8.width,
                Text('Sign in with Apple', style: boldTextStyle()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
