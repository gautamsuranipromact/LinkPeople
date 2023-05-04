import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/int_extensions.dart';

import '../main.dart';
import '../utils/AppCommon.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/text_styles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgetPassFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool isAPIRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: context.scaffoldBackgroundColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left: 0, top: 16),
            child: appStore.isDarkMode
                ? Image.asset(ic_logo_light, height: 25, fit: BoxFit.cover)
                : Image.asset(ic_logo, height: 25, fit: BoxFit.cover),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: forgetPassFormKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text("Forgot Password?", style: boldTextStyle(size: 35)),
                    Text("Reset password in two quick steps",
                        style: secondaryTextStyle()),
                    SizedBox(height: 30),
                    AppTextField(
                      enabled: !appStore.isLoading,
                      autoFocus: true,
                      controller: emailController,
                      textFieldType: TextFieldType.EMAIL,
                      textStyle: boldTextStyle(),
                      isValidationRequired: true,
                      /*decoration: inputDecoration(
                        context,
                        label: language.enterYourEmail,
                        labelStyle: secondaryTextStyle(weight: FontWeight.w600),
                      ),*/
                    ).paddingSymmetric(horizontal: 16),
                    30.height,
                  ],
                ),
              ),
              isAPIRunning
                  ? Center(child: CircularProgressIndicator())
                  : GestureDetector(
                      child:
                          appButton(context, 'Reset Password', onTap: () async {
                        hideKeyboard(context);
                        forgotPassword();
                      }),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    appStore.setLoading(false);
    super.dispose();
  }

  void forgotPassword() async {
    setState(() {
      isAPIRunning = true;
    });
    try {
      FirebaseAuth _authService = FirebaseAuth.instance;
      await _authService.sendPasswordResetEmail(
          email: emailController.text.trim());
      toast("Reset email sent successfully please check your email box");
    } on FirebaseAuthException catch (e) {
      if (e.code.toString() == 'invalid-email') {
        // setState(() {message 'Invalid email address.';});
        toast("Invalid email address.");
      }

      if (e.code.toString() == 'missing-email') {
        toast("Email address not found.");
      }

      if (e.code.toString() == 'user-not-found') {
        toast("User not found.");
      }
    } catch (e) {
      toast("Something want wrong.");
    }
    setState(() {
      isAPIRunning = false;
    });
  }
}
