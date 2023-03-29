import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/text_styles.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
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
      appBar: appBarCommon(context, "Events", () {
        finish(context);
      }),
      body: Column(
        children: [
          Container(
            height: 50,
            width: context.width(),
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(color: context.scaffoldBackgroundColor, boxShadow: [BoxShadow(blurRadius: 0)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0 events', style: secondaryTextStyle()),
                TextButton(onPressed: (){}, child: Text('Create',style: secondaryTextStyle(color: primaryColor)),)
              ],
            ),
          ),
          SizedBox(height: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ic_jobs, width: context.width() * 0.5, height: 150),
                SizedBox(height: 20),
                Text('Looks like you are not attending any events', style: secondaryTextStyle()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
