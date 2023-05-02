import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/main.dart';
import 'package:link_people/utils/AppDataProvider.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../screens/ProfileScreen.dart';
import '../utils/AppColors.dart';
import '../utils/AppConstants.dart';

bool isExpand = false;
bool isExpanded = false;

Widget drawerComponent(BuildContext context, onTap) {
  return Container(
    padding: EdgeInsets.only(
        top: context.statusBarHeight, left: 12, right: 16, bottom: 16),
    width: MediaQuery.of(context).size.width,
    child: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                finish(context);
                //ViewProfileScreen(isUser: true).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                ProfileScreen(
                        true, prefs.getString(SharePreferencesKey.USERID)!)
                    .launch(context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    prefs.getString(SharePreferencesKey.PROFILE)!.isNotEmpty
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                                prefs.getString(SharePreferencesKey.PROFILE)!),
                            maxRadius: 30,
                            minRadius: 20,
                            backgroundColor: context.cardColor)
                        : CircleAvatar(
                            backgroundImage: AssetImage(ic_profile),
                            backgroundColor: context.cardColor,
                            maxRadius: 50),
                    SizedBox(height: 10),
                    Text(
                        prefs.getString(SharePreferencesKey.FIRSTNAME)! +
                            " " +
                            prefs.getString(SharePreferencesKey.LASTNAME)!,
                        style: boldTextStyle()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Visibility(visible: !isExpand, child: Divider(thickness: 1)),
            ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                onExpansionChanged: (v) {
                  log(v);
                  isExpand = !isExpand;
                  onTap();
                },
                tilePadding: EdgeInsets.only(left: 8, bottom: 0),
                childrenPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Text("Recent", style: secondaryTextStyle(size: 16)),
                children: hashTagList
                    .map(
                      (e) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: GestureDetector(
                            onTap: () {
                              finish(context);
                            },
                            child: Text("# " + e.text.toString(),
                                style: primaryTextStyle(),
                                textAlign: TextAlign.start)),
                      ),
                    )
                    .toList()),
            TextButton(
                onPressed: () {
                  // finish(context);
                  // GroupScreen().launch(context,
                  //     pageRouteAnimation: PageRouteAnimation.Slide);
                },
                child: Text('Groups', style: boldTextStyle())),
            TextButton(
                onPressed: () {
                  // finish(context);
                  // EventsScreen().launch(context,
                  //     pageRouteAnimation: PageRouteAnimation.Slide);
                },
                child: Text('Events', style: boldTextStyle())),
            ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                onExpansionChanged: (v) {
                  log(v);
                  isExpanded = !isExpanded;
                  onTap();
                },
                tilePadding: EdgeInsets.only(left: 12, bottom: 0),
                childrenPadding: EdgeInsets.symmetric(horizontal: 12),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Text("Follow Hashtags", style: boldTextStyle()),
                children: hashTagList
                    .map(
                      (e) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: GestureDetector(
                            onTap: () {
                              finish(context);
                            },
                            child: Text("# " + e.text.toString(),
                                style: primaryTextStyle(),
                                textAlign: TextAlign.start)),
                      ),
                    )
                    .toList()),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(visible: !isExpanded, child: Divider(thickness: 1)),
            TextButton(
              onPressed: () {
                // finish(context);
                // PremiumScreen().launch(context,
                //     pageRouteAnimation: PageRouteAnimation.Slide);
              },
              child: Row(
                children: [
                  Icon(Ionicons.square, color: tanColor),
                  SizedBox(width: 6),
                  Text('Try Premium For Free',
                      style: boldTextStyle(color: primaryColor)),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // finish(context);
                // SettingsScreen().launch(context,
                //     pageRouteAnimation: PageRouteAnimation.Slide);
              },
              child: Row(
                children: [
                  Icon(Ionicons.settings, color: textSecondaryColorGlobal),
                  SizedBox(width: 6),
                  Text('Settings', style: boldTextStyle()),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
