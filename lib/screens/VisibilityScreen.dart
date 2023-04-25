import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';

class VisibilityScreen extends StatefulWidget {
  @override
  _VisibilityScreenState createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
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
        "Visibility",
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
          component(context, "Visibility of your profile & network",
              'Setting to help you kep you account secure',
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Profile viewing options",
              "Choose whether you've visible or viewing in private mode"),
          component(context, "Edit your public profile",
              'Choose how your profile appear to non-logged in member via search'),
          component(context, "Who can see or download your email address",
              'Choose who can see you email address on your profile or in approved apps or download your email address in their data export'),
          component(context, "Connection",
              "Choose if your connections can see your connection list"),
          component(context, "Who can see your last name",
              'Choose if others can see who you follow'),
          component(context, "Representing your organizations and interests",
              "Choose if we mention you with content about your employers or other content you publicly express an interest in"),
          component(context, "Profile discovery and visibility off LinkPeople",
              'Choose whether approved apps and partner services can find and display information from your profile'),
          component(context, "Profile discovery using email address",
              "Choose who can discover your profile if they haven't Connected with you,but have you email address"),
          component(context, "Profile discovery using phone address",
              "Choose who can discover your profile if they haven't Connected with you,but have you phone number"),
          component(context, "Blocking",
              "See your list and make changes if you'd like"),
          component(context, "Visibility of youLinkPeople activity",
              'Make sure your network only sees the activity your choose to show',
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Manage active status",
              'Choose who can see you when you are active on LinkPeople'),
          component(context, "Share profile updates with you network",
              "Choose if your network is notified when you are make key updates to your profile"),
          component(context, "Notify connection",
              "Choose if your network is notified when you've been mentioned in and article or blog"),
          component(context, "Mentions or Tags",
              "Choose whether other member can mention or tag you"),
          component(context, "Followers",
              'Choose who can follow you and see your public update'),
        ],
      ),
    );
  }
}
