import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';

class SignInSecurityScreen extends StatefulWidget {
  @override
  _SignInSecurityScreenState createState() => _SignInSecurityScreenState();
}

class _SignInSecurityScreenState extends State<SignInSecurityScreen> {
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
      appBar: appBarCommon(
        context,
        "Sign in & security",
        () {
          finish(context);
        },
        action: [
          IconButton(
            onPressed: () {},
            icon: Icon(AntDesign.questioncircle, color: context.iconColor),
          ),
        ],
      ),
      body: ListView(
        children: [
          component(context, "Account Access",
              'Setting to help you kep you account secure',
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Email Address",
              'Add or remove email address on your account'),
          component(context, "Phone numbers",
              'Add a phone number in case you have trouble signing in'),
          component(context, "change password",
              'Choose unique password to protect to your account'),
          component(context, "Where you're signed in",
              "See your active sessions, and sign out if you'd like"),
          component(context, "Devices that remember your password",
              'Manage the device that remember your password'),
          component(context, "Two-step verification",
              "Active this feature for enhanced account security"),
          component(context, "App lock",
              'Make access to the LinkPeople app more secure'),
        ],
      ),
    );
  }
}
