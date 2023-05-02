import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Colors.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../main.dart';
import '../utils/AppConstants.dart';

class AddSocialInfo extends StatefulWidget {
  @override
  _AddSocialInfoState createState() => _AddSocialInfoState();
}

class _AddSocialInfoState extends State<AddSocialInfo> {
  TextEditingController linkedInCont = TextEditingController();
  TextEditingController facebookCont = TextEditingController();
  TextEditingController twitterCont = TextEditingController();
  bool isAPIRunning = false;

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
          automaticallyImplyLeading: false,
          title: Padding(
              padding: EdgeInsets.only(left: 0, top: 16),
              child: appStore.isDarkMode
                  ? Image.asset(ic_logo_light, height: 15, fit: BoxFit.cover)
                  : Image.asset(ic_logo, height: 15, fit: BoxFit.cover))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add your social information",
                      style: primaryTextStyle(size: 35)),
                  SizedBox(height: 30),

                  /// LinkedIn
                  Text(
                    "LinkedIn",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: linkedInCont,
                    style: TextStyle(
                        fontSize: 14,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      hintText: "LinkedIn",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Facebook
                  Text(
                    "Facebook",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: facebookCont,
                    style: TextStyle(
                        fontSize: 14,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      hintText: "Facebook",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Twitter
                  Text(
                    "Twitter",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: twitterCont,
                    style: TextStyle(
                        fontSize: 14,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      hintText: "Twitter",
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 24),
                ],
              ),
            ),
            isAPIRunning
                ? CircularProgressIndicator()
                : appButton(context, 'Continue', onTap: () {
                    hideKeyboard(context);
                    addMoreUserDetail();
                  }),
          ],
        ),
      ),
    );
  }

  checkNullValue(value) {
    return value == null ? "" : value;
  }

  void addMoreUserDetail() {
    setState(() {
      isAPIRunning = true;
    });
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    CollectionReference profile =
        FirebaseFirestore.instance.collection('profile');
    profile
        .doc(userId)
        .update({
          "linkedIn": linkedInCont.text,
          "facebook": facebookCont.text,
          "twitter": twitterCont.text,
        })
        .then((value) => _next())
        .catchError((error) => _error());

    /*DatabaseReference ref = FirebaseDatabase.instance.ref("profile/$userId");
    ref.update({
      "linkedIn": linkedInCont.text,
      "facebook": facebookCont.text,
      "twitter": twitterCont.text,
    }).whenComplete(() {
      setState(() {
        isAPIRunning = false;
      });
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => DashboardScreen(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    });*/
  }

  _next() {
    setState(() {
      isAPIRunning = false;
    });
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => DashboardScreen(),
      ),
      (route) => false, //if you want to disable back feature set to false
    );
  }

  _error() {
    setState(() {
      isAPIRunning = false;
    });
  }
}
