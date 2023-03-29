import 'package:flutter/material.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import '../main.dart';
import 'AddEmailScreen.dart';

class JoinNowScreen extends StatefulWidget {
  @override
  _JoinNowScreenState createState() => _JoinNowScreenState();
}

class _JoinNowScreenState extends State<JoinNowScreen> {
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
              child: appStore.isDarkMode ? Image.asset(ic_logo_light, height: 15, fit: BoxFit.cover) : Image.asset(ic_logo, height: 15, fit: BoxFit.cover))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add your name", style: primaryTextStyle(size: 35)),
                  SizedBox(height: 30),
                  TextFormField(decoration: InputDecoration(label: Text("First Name*", style: secondaryTextStyle(size: 16)), labelStyle: secondaryTextStyle(), focusedBorder: UnderlineInputBorder())),
                  SizedBox(height: 20),
                  TextFormField(decoration: InputDecoration(label: Text("Last Name*", style: secondaryTextStyle(size: 16)), labelStyle: secondaryTextStyle(), focusedBorder: UnderlineInputBorder())),
                  SizedBox(height: 30),
                ],
              ),
            ),
            appButton(context, 'Continue', onTap: () {
              AddEmailScreen().launch(context);
            }),
          ],
        ),
      ),
    );
  }
}
