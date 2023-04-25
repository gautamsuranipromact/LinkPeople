import 'package:flutter/material.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppColors.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

class GroupScreen extends StatefulWidget {
  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  int currentIndex = 0;

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarCommon(context, "Events", () {
          finish(context);
        }, action: [
          TextButton(
            onPressed: () {},
            child: Text('Create', style: secondaryTextStyle()),
          )
        ]),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 50,
              width: context.width(),
              decoration: BoxDecoration(
                  color: context.scaffoldBackgroundColor,
                  boxShadow: [BoxShadow(blurRadius: 1)]),
              child: TabBar(
                onTap: (i) {
                  currentIndex = i;
                  setState(() {});
                },
                indicatorColor: greenColor,
                labelColor: greenColor,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                unselectedLabelStyle: secondaryTextStyle(),
                unselectedLabelColor: textSecondaryColorGlobal,
                tabs: [
                  Tab(child: Text('My groups')),
                  Tab(child: Text('Requests')),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(children: [
              groupComponent(context),
              groupComponent(context)
            ]))
          ],
        ),
      ),
    );
  }
}

groupComponent(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ic_walk3, width: context.width() * 0.7, height: 150),
        SizedBox(height: 8),
        Text('Discover groups', style: boldTextStyle(size: 20)),
        SizedBox(height: 8),
        Text(
            "Find other trusted communities that share and support your goals.",
            style: secondaryTextStyle()),
        SizedBox(height: 8),
        Container(
          height: 30,
          width: 130,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: context.scaffoldBackgroundColor,
              border: Border.all(width: 0.8, color: primaryColor),
              borderRadius: radius(20)),
          child: Text('Discover', style: primaryTextStyle(color: primaryColor)),
        )
      ],
    ),
  );
}
