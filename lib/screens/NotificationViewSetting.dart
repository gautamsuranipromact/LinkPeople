import 'package:flutter/material.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';

import '../utils/Extensions/text_styles.dart';

class NotificationViewSetting extends StatefulWidget {
  @override
  _NotificationViewSettingState createState() =>
      _NotificationViewSettingState();
}

class _NotificationViewSettingState extends State<NotificationViewSetting> {
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
      appBar: appBarCommon(context, "On LinkPeople", () {
        finish(context);
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text('Received via LinkPeople web and app',
                style: secondaryTextStyle()),
          ),
          Divider(thickness: 1),
          component("Job", "Job activities,hiring insights"),
          component("Network", "Group,events,anniversaries,invites,birthdays"),
          component("News", "Daily rundown,mentioned in the news"),
          component("Profile", "Endorsements, profile views", isDivider: false),
        ],
      ),
    );
  }

  component(text, subtext, {bool isDivider = true}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: boldTextStyle()),
                  Text(subtext, style: secondaryTextStyle()),
                ],
              ),
              Icon(Icons.arrow_forward, color: textSecondaryColorGlobal)
            ],
          ),
        ),
        Visibility(visible: isDivider, child: Divider(thickness: 1)),
      ],
    );
  }
}
