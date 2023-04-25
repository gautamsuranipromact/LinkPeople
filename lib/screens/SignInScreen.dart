import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppConstants.dart';
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
import 'ForgotPasswordScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();

  //bool isRemember = false;

  @override
  void initState() {
    super.initState();
    if (appStore.doRemember) {
      emailCon.text = appStore.loginName;
      passCon.text = appStore.password;
    } else if (isIqonicProduct) {
      emailCon.text = DEMO_USER_EMAIL;
      passCon.text = DEMO_USER_PASSWORD;
    } else {
      //
    }
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
          child: appStore.isDarkMode
              ? Image.asset(ic_logo_light, height: 15, fit: BoxFit.cover)
              : Image.asset(ic_logo, height: 15, fit: BoxFit.cover),
        ),
/*        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: TextButton(
                onPressed: () {
                  AddEmailScreen(isSignIn: true).launch(context);
                },
                child: Text('Join now', style: primaryTextStyle(color: primaryColor))),
          ),
        ],*/
      ),
      body: SingleChildScrollView(
        child: Form(
          key: loginFormKey,
          child: Column(
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
                      autoFocus: false,
                      textFieldType: TextFieldType.EMAIL,
                      keyboardType: TextInputType.emailAddress,
                      errorThisFieldRequired: errorThisFieldRequired,
                      decoration:
                          inputDecoration(context, label: "Email or Phone"),
                    ),
                    16.height,
                    AppTextField(
                      controller: passCon,
                      textFieldType: TextFieldType.PASSWORD,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String? value) {
                        if (value.validate().isEmpty)
                          return errorThisFieldRequired;
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
                      value: appStore.doRemember,
                      onChanged: (bool? value) async {
                        appStore.setRemember(!appStore.doRemember);
                        setState(() {});
                      },
                    ),
                  ),
                  Text("Remember me.", style: secondaryTextStyle(size: 16)),
                  4.width,
                  Text('Learn More',
                      style: boldTextStyle(color: primaryColor, size: 14)),
                ],
              ),
              20.height,
              GestureDetector(
                  onTap: () {
                    ForgotPasswordScreen().launch(context);
                  },
                  child: Text('Forgot Password?',
                          style: boldTextStyle(color: primaryColor, size: 14))
                      .paddingSymmetric(horizontal: 16)),
              8.height,
              appButton(context, 'Continue', onTap: () {
                if (loginFormKey.currentState!.validate()) {
                  loginFormKey.currentState!.save();
                  hideKeyboard(context);
                  /*Map request = {
                    Users.username: emailCon.text.trim().validate(),
                    Users.password: passCon.text.trim().validate(),
                  };
                  login(request);*/
                  if (emailCon.text.isEmpty) {
                    toast("Please enter email");
                  } else if (passCon.text.isEmpty) {
                    toast("Please enter password");
                  } else {
                    signInUsingEmailPassword(emailCon.text, passCon.text);
                  }
                } else {
                  appStore.setLoading(false);
                }
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
                    backgroundColor: context.scaffoldBackgroundColor,
                    borderRadius: radius(30),
                    blurRadius: 0,
                    spreadRadius: 0,
                    border:
                        Border.all(width: 1, color: textSecondaryColorGlobal)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ic_google,
                        height: 25, width: 25, fit: BoxFit.cover),
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
                    backgroundColor: context.scaffoldBackgroundColor,
                    borderRadius: radius(30),
                    blurRadius: 0,
                    spreadRadius: 0,
                    border:
                        Border.all(width: 1, color: textSecondaryColorGlobal)),
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
        ),
      ),
    );
  }

  void signInUsingEmailPassword(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      readDataFromUserTable(user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        toast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
        toast('Wrong password provided.');
      }else if (e.code == 'email-already-in-use') {
        print('Email already in use.');
        toast('Email already in use.');
      } else {
        print(e.toString());
        toast(e.toString());
      }
    }
  }

  checkNullValue(value) {
    return value == null ? "" : value;
  }

  void readDataFromUserTable(User user) {
    String userId = user.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref('users/$userId');
    ref.onValue.listen((DatabaseEvent event) {
      print("User Data:" + event.snapshot.value.toString());
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      prefs.setString(SharePreferencesKey.USERID, checkNullValue(user.uid));
      prefs.setString(
          SharePreferencesKey.FIRSTNAME, checkNullValue(map['firstname']));
      prefs.setString(
          SharePreferencesKey.LASTNAME, checkNullValue(map['lastname']));
      prefs.setString(SharePreferencesKey.EMAIL, checkNullValue(map['email']));
      prefs.setString(
          SharePreferencesKey.USERNAME, checkNullValue(map['username']));
      prefs.setString(
          SharePreferencesKey.PROFILE, checkNullValue(map['profile']));

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return DashboardScreen();
      }));
    });
  }
}

/*
  Future<void> login({required Map req, bool isSocialLogin = false}) async {
    appStore.setLoading(true);

    hideKeyboard(context);

    await loginUser(request: req, isSocialLogin: isSocialLogin)
        .then((value) async {

      /// Set Prefrences
      prefs.setString(SharePreferencesKey.TOKEN, value.token!);
      prefs.setString(SharePreferencesKey.LOGIN_EMAIL, value.userEmail!);
      prefs.setString(
          SharePreferencesKey.LOGIN_DISPLAY_NAME, value.userNickname!);
      prefs.setString(
          SharePreferencesKey.LOGIN_FULL_NAME, value.userDisplayName!);

      appStore.setPassword(passCon.text.validate());
      getMemberById();
    }).catchError((e) {
      appStore.setLoading(false);
      toast(e.toString());
    });
  }

  Future<void> getMemberById() async {
    await getLoginMember().then((value) {
      appStore.setLoginUserId(value.id.toString());
      appStore.setLoginAvatarUrl(value.avatarUrls!.full.validate());
      appStore.setLoading(false);

      prefs.setString(SharePreferencesKey.LOGIN_USER_ID, value.id.toString());
      prefs.setString(
          SharePreferencesKey.LOGIN_AVATAR_URL, value.avatarUrls!.full!);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return DashboardScreen();
      }));
    }).catchError((e) {
      appStore.setLoading(false);
      toast(e.toString());
    });
  }
*/
