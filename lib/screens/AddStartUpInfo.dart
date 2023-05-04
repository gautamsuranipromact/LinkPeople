import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_people/screens/AddSocialInfo.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Colors.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../main.dart';
import '../utils/AppConstants.dart';

class AddStartUpInfo extends StatefulWidget {
  @override
  _AddStartUpInfoState createState() => _AddStartUpInfoState();
}

class _AddStartUpInfoState extends State<AddStartUpInfo> {
  TextEditingController aboutStartUpCont = TextEditingController();
  TextEditingController startUpAgeCont = TextEditingController();
  TextEditingController stageCont = TextEditingController();
  TextEditingController fundingCont = TextEditingController();
  TextEditingController websiteCont = TextEditingController();
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
                  ? Image.asset(ic_logo_light, height: 25, fit: BoxFit.cover)
                  : Image.asset(ic_logo, height: 25, fit: BoxFit.cover))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add your start-up information",
                      style: primaryTextStyle(size: 35)),
                  SizedBox(height: 30),
                  Text(
                    "About Startup",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: aboutStartUpCont,
                    maxLines: 3,
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
                      hintText: "About Startup",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Startup Age
                  Text(
                    "Startup Age",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: startUpAgeCont,
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
                      hintText: "Startup Age",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Stage
                  Text(
                    "Stage",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: stageCont,
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
                      hintText: "Stage",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Funding
                  Text(
                    "Funding",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: fundingCont,
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
                      hintText: "Funding",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Website
                  Text(
                    "Website",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: websiteCont,
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
                      hintText: "Website",
                    ),
                  ),
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
          "aboutStartup": aboutStartUpCont.text,
          "startupAge": startUpAgeCont.text,
          "stage": stageCont.text,
          "funding": fundingCont.text,
          "website": websiteCont.text,
        })
        .then((value) => _next())
        .catchError((error) => _error());

    /*DatabaseReference ref = FirebaseDatabase.instance.ref("profile/$userId");
    ref.update({
      "aboutStartup": aboutStartUpCont.text,
      "startupAge": startUpAgeCont.text,
      "stage": stageCont.text,
      "funding": fundingCont.text,
      "website": websiteCont.text,
    }).whenComplete(() {
      setState(() {
        isAPIRunning = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return AddSocialInfo();
      }));
    });*/
  }

  _next() {
    setState(() {
      isAPIRunning = false;
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return AddSocialInfo();
    }));
  }

  _error() {
    setState(() {
      isAPIRunning = false;
    });
  }
}
