import 'package:flutter/material.dart';
import 'package:link_people/components/JobListComponent.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppColors.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

class AppSettingScreen extends StatefulWidget {
  @override
  _AppSettingScreenState createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
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
      appBar: appBarCommon(context, "Job in india", () {
        finish(context);
      }),
      body: ListView(
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                boxShadow: [BoxShadow(blurRadius: 1)]),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.filter_list_rounded)),
                Container(
                  height: 30,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: radius(20), color: greenColor),
                  child: Text('Saved',
                      style: primaryTextStyle(color: Colors.white)),
                ),
                VerticalDivider(thickness: 1, width: 10),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: context.dividerColor,
            child: Text('35,47,467 jobs', style: secondaryTextStyle()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: jobList(() {
              setState(() {});
            }),
          )
        ],
      ),
    );
  }
}
