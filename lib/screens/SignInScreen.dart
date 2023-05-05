import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:link_people/screens/AddRequiredData.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import 'package:link_people/utils/Extensions/int_extensions.dart';
import 'package:link_people/utils/Extensions/string_extensions.dart';

import '../main.dart';
import '../utils/AppCommon.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
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

  bool isAPIRunning = false;
  bool isSignUpRunning = false;

  String selectedUserType = 'Founder';
  String selectedLookingFor = 'Mentor';

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
              ? Image.asset(ic_logo_light, height: 25, fit: BoxFit.cover)
              : Image.asset(ic_logo, height: 25, fit: BoxFit.cover),
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                          decoration:
                              inputDecoration(context, label: "Password"),
                          onFieldSubmitted: (c) {},
                        ),
                        20.height,
                      ],
                    ),
                  ),
                  /*Row(
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
                  ),*/
                  20.height,
                  GestureDetector(
                      onTap: () {
                        ForgotPasswordScreen().launch(context);
                      },
                      child: Text('Forgot Password?',
                              style:
                                  boldTextStyle(color: primaryColor, size: 14))
                          .paddingSymmetric(horizontal: 16)),
                  8.height,
                  isAPIRunning
                      ? Center(child: CircularProgressIndicator())
                      : appButton(context, 'Continue', onTap: () {
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
                              signInUsingEmailPassword(
                                  emailCon.text, passCon.text);
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
                  GestureDetector(
                    onTap: () => _signWithGoogle(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: context.width(),
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: boxDecorationWithShadowWidget(
                          backgroundColor: context.scaffoldBackgroundColor,
                          borderRadius: radius(30),
                          blurRadius: 0,
                          spreadRadius: 0,
                          border: Border.all(
                              width: 1, color: textSecondaryColorGlobal)),
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
                  ),
                  /*Container(
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
                  ),*/
                ],
              ),
            ),
          ),
          if (isSignUpRunning) Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }

  void signInUsingEmailPassword(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    setState(() {
      isAPIRunning = true;
    });
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      readDataFromUserTable(user!.uid, false);
    } on FirebaseAuthException catch (e) {
      setState(() {
        isAPIRunning = false;
      });
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        toast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
        toast('Wrong password provided.');
      } else if (e.code == 'email-already-in-use') {
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

  void readDataFromUserTable(String userId, bool isNew) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot snapshot = await users.doc(userId).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    prefs.setString(SharePreferencesKey.USERID, checkNullValue(userId));
    prefs.setString(
        SharePreferencesKey.FIRSTNAME, checkNullValue(data['firstname']));
    prefs.setString(
        SharePreferencesKey.LASTNAME, checkNullValue(data['lastname']));
    prefs.setString(SharePreferencesKey.EMAIL, checkNullValue(data['email']));
    prefs.setString(
        SharePreferencesKey.USERNAME, checkNullValue(data['username']));
    prefs.setString(
        SharePreferencesKey.PROFILE, checkNullValue(data['profile']));
    prefs.setString(
        SharePreferencesKey.USER_TYPE, checkNullValue(data['type']));
    prefs.setString(
        SharePreferencesKey.LOOKING_FOR, checkNullValue(data['lookingFor']));
    if (isNew) {
      await addDetailsToProfileTable(userId);
    }
    setState(() {
      isAPIRunning = false;
      isSignUpRunning = false;
    });
    if (!isNew) {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => DashboardScreen(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return AddRequiredData();
      }));
    }
  }

  _signWithGoogle() async {
    setState(() {
      isSignUpRunning = true;
    });
    UserCredential userCredential = await signInWithGoogle();
    addDetailsToUserTable(userCredential);
  }

  void addDetailsToUserTable(UserCredential user) async {
    if (user.user == null) {
      toast("No user found");
      setState(() {
        isSignUpRunning = false;
      });
      return;
    }
    String userId = user.user!.uid;

    if (await isUserAvailable(userId)) {
      readDataFromUserTable(userId, false);
    } else {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users
          .doc(userId)
          .set({
            "userId": userId,
            "firstname": user.user!.displayName,
            "lastname": "",
            "email": user.user!.email,
            "username": "",
            "password": "",
            "type": selectedUserType,
            "lookingFor": selectedLookingFor,
            "profile":
                "https://findmycofounders.com//wp-content//plugins//socialv-api////assets//images//default-avatar.jpg",
          })
          .then((value) => _next(userId))
          .catchError((error) {
            setState(() {
              isSignUpRunning = false;
            });
            print("Failed to add user: $error");
          });
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<bool> isUserAvailable(String userId) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot snapshot = await users.doc(userId).get();
    return snapshot.exists;
  }

  _next(String userId) async {
    toast("Register successfully");
    readDataFromUserTable(userId, true);
  }

  Future<void> addDetailsToProfileTable(String userId) async {
    CollectionReference profile =
        FirebaseFirestore.instance.collection('profile');
    await profile.doc(userId).set({
      "firstname": prefs.getString(SharePreferencesKey.FIRSTNAME)!,
      "lastname": prefs.getString(SharePreferencesKey.LASTNAME)!,
      "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
      "designation": "",
      "lookingFor": "",
      "aboutMe": "",
      "aboutStartup": "",
      "startupAge": "",
      "stage": "",
      "funding": "",
      "website": "",
      "coreSkills": "",
      "education": [],
      "experience": [],
      "linkedIn": "",
      "facebook": "",
      "twitter": "",
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
