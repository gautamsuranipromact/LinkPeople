import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../utils/Extensions/text_styles.dart';

class MyJobsScreen extends StatefulWidget {
  @override
  _MyJobsScreenState createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen> {
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
      appBar: appBarCommon(context, "My Jobs", () {
        finish(context);
      }),
      body: Column(
        children: [
          Container(
            height: 50,
            width: context.width(),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                boxShadow: [BoxShadow(blurRadius: 1)]),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: radius(20), color: greenColor),
                  child: Text('Saved',
                      style: primaryTextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ic_jobs, width: context.width() * 0.7, height: 150),
                SizedBox(height: 8),
                Text('Start saving jobs you are interested in',
                    style: boldTextStyle(size: 20)),
                SizedBox(height: 8),
                Text("Once jobs are saved, you'll find them here",
                    style: secondaryTextStyle()),
                SizedBox(height: 8),
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                      color: context.scaffoldBackgroundColor,
                      border: Border.all(width: 0.8, color: primaryColor),
                      borderRadius: radius(20)),
                  child: Text('Browse jobs for me',
                      style: primaryTextStyle(color: primaryColor)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
