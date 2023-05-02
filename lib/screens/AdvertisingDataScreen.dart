import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';

class AdvertisingDataScreen extends StatefulWidget {
  @override
  _AdvertisingDataScreenState createState() => _AdvertisingDataScreenState();
}

class _AdvertisingDataScreenState extends State<AdvertisingDataScreen> {
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
        "Advertising data",
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
          component(context, "Advertising preferences",
              'Choose how your data is used to show you more relevant ads',
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Profile data for personalizing ads",
              "Choose how ads appear to you"),
          component(context, "Interest Categories",
              'See more relevant ads, such as job ads,based on your and similar member activities on Find My CoFounder and bing'),
          component(context, "Data collected on Find My CoFounder",
              "Choose what type of data you'd like Find My CoFounder to use to show you more relevant",
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Connection",
              'Choose whether your connections can be used to show you relevant ads'),
          component(context, "Location",
              "Choose whether your location can be used to show you relevant ads"),
          component(context, "Demographics",
              'Choose whether your age or gender can be used to show you relevant ads'),
          component(context, "Companies you follow",
              "Choose whether the companies you follow can be used to show you relevant ads"),
          component(context, "Groups",
              "Choose whether the groups you've join can be used to show you relevant ads"),
          component(context, "Education",
              "Choose whether your education can be used to show relevant ads"),
          component(context, "Job Information",
              "Choose whether your job information can be used to show you relevant ads"),
          component(context, "Employer",
              "Choose whether your employment history can be used to show you relevant ads"),
          // component(context, "Third party", "Choose how you'd like data from your activity off Find My CoFounder to be used to show you more relevant ads",
          //     color: context.dividerColor, size: 20, subSize: 16, textColor: textPrimaryColorGlobal, isIcon: false),
          // component(context, "Manage active status", 'Choose who can see you when you are active on Find My CoFounder'),
          // component(context, "Share profile updates with you network", "Choose if your network is notified when you are make key updates to your profile"),
          // component(context, "Notify connection", "Choose if your network is notified when you've been mentioned in and article or blog"),
          // component(context, "Mentions or Tags", "Choose whether other member can mention or tag you"),
          // component(context, "Followers", 'Choose who can follow you and see your public update'),
        ],
      ),
    );
  }
}
