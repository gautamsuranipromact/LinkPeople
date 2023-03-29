import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';

class DataPrivacyScreen extends StatefulWidget {
  @override
  _DataPrivacyScreenState createState() => _DataPrivacyScreenState();
}

class _DataPrivacyScreenState extends State<DataPrivacyScreen> {
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
        "Data privacy",
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
          component(context, "How LinkPeople uses your data", "Manage how you data is used and download it anytime",
              color: context.dividerColor, size: 20, subSize: 16, textColor: textPrimaryColorGlobal, isIcon: false),
          component(context, "Manage you dat and activity", "Review the data that you've provided,and make changes if you'd like"),
          component(context, "Get a copy of your data", 'See you options for accessing a copy of your account data, connections,and more'),
          component(context, "Salary data on LinkPeople", "See and delete your salary"),
          component(context, "Search History", "clear all previous searches performed on LinkPeople"),
          component(context, "Personal demographic information", "Choose what details you provide about you personal demographics"),
          component(context, "Social,economic,and workplace research", "Choose whether we can make come of your data available for policy an academic research"),
          component(context, "Job seeking preferences", "Privacy controls for job seeking activity on LinkPeople",
              color: context.dividerColor, size: 20, subSize: 16, textColor: textPrimaryColorGlobal, isIcon: false),
          component(context, "Job application settings", "Choose what information LinkPeople saves when you submit a job application "),
          component(
              context, "Share your profile when you click apply for a job", "Choose if you want to share your full profile with the job poster when you're taken off LinkPeople after clicking apply"),
          component(context, "Signal your interest to recruiters at companies you're created job alerts for", "This will be applied for companies that you've create job alert for"),
          component(context, "Store job applicant account", "Manage which third-party job application account are store on LinkPeople"),
          component(context, "Other applications", "Control how associated account can use you data",
              color: context.dividerColor, size: 20, subSize: 16, textColor: textPrimaryColorGlobal, isIcon: false),
          component(context, "Permitted Services", "View services you've authorized and manage data sharing"),
          component(context, "Microsoft Word", "Choose whether work experience from your profile can be shown in Resume Assistant within microsoft Word"),
        ],
      ),
    );
  }
}
