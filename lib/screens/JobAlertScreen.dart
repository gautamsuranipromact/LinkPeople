import 'package:flutter/material.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppColors.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

class JobAlertScreen extends StatefulWidget {
  @override
  _JobAlertScreenState createState() => _JobAlertScreenState();
}

class _JobAlertScreenState extends State<JobAlertScreen> {
  bool isAlert = false;

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
      appBar: appBarCommon(context, "Job alerts", () {
        finish(context);
      }),
      body: Column(
        children: [
          Image.asset(ic_walk3, width: context.width(), height: 150),
          SizedBox(height: 8),
          Text('Get notified about new jobs', style: boldTextStyle()),
          SizedBox(height: 8),
          Text("Once you create job alerts, you'll find them here.",
              style: primaryTextStyle()),
          SizedBox(height: 8),
          Container(
            height: 30,
            width: 130,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                border: Border.all(width: 0.8, color: textSecondaryColorGlobal),
                borderRadius: radius(20)),
            child: Text('Search for jobs', style: secondaryTextStyle()),
          ),
          SizedBox(height: 50),
          Divider(),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Job recommendations', style: boldTextStyle()),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                  'Based on your job alerts, activity, and profile.',
                                  style: secondaryTextStyle())),
                          SizedBox(width: 8),
                          Text(isAlert == true ? "On" : "Off",
                              style: secondaryTextStyle()),
                        ],
                      ),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    activeColor: primaryColor,
                    value: isAlert,
                    onChanged: (v) {
                      isAlert = !isAlert;
                      setState(() {});
                    },
                  ).withHeight(10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
