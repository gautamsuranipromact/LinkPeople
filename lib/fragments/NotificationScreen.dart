import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import 'package:styled_text/styled_text.dart';

import '../screens/NotificationViewSetting.dart';
import '../utils/AppColors.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/text_styles.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      body: ListView.separated(
        itemCount: notificationsList.length,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return Visibility(
              visible: index != notificationsList.length - 1,
              child: Divider(
                thickness: 1,
                height: 0,
              ));
        },
        itemBuilder: (BuildContext context, int index) {
          bottomSheetComponent(IconData icon, text, subtext, onTap) {
            return GestureDetector(
              onTap: () {
                onTap();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Icon(icon, color: textSecondaryColorGlobal, size: 20),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyledText(
                          text: text,
                          tags: {
                            'b': StyledTextTag(style: secondaryTextStyle()),
                          },
                          style: boldTextStyle(),
                        ),
                        StyledText(
                          text: subtext,
                          tags: {
                            'b': StyledTextTag(style: secondaryTextStyle()),
                          },
                          style: secondaryTextStyle(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
            decoration: BoxDecoration(
                color: notificationsList[index].isRead
                    ? context.scaffoldBackgroundColor
                    : primaryColor.withOpacity(0.1)),
            child: Row(
              children: [
                Icon(Entypo.dot_single, color: primaryColor)
                    .visible(!notificationsList[index].isRead),
                SizedBox(width: 24).visible(notificationsList[index].isRead),
                CircleAvatar(
                        backgroundImage:
                            AssetImage(notificationsList[index].image),
                        minRadius: 25)
                    .visible(!notificationsList[index].isJob &&
                        !notificationsList[index].profileView),
                if (notificationsList[index].isJob) ...[
                  Image.asset(notificationsList[index].image,
                      height: 50, width: 50)
                ] else if (notificationsList[index].profileView) ...[
                  Image.asset(notificationsList[index].image,
                      height: 50, width: 50)
                ] else ...[
                  SizedBox.shrink()
                ],
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledText(
                      text: notificationsList[index].name,
                      tags: {
                        'b': StyledTextTag(
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      },
                      style: secondaryTextStyle(color: textPrimaryColorGlobal),
                    ),
                    if (notificationsList[index].isJob) ...[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        margin: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 0.8),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("View 4 jobs",
                            style: secondaryTextStyle(color: primaryColor)),
                      )
                    ] else if (notificationsList[index].profileView) ...[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        margin: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 0.8),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("Try premium free for 1 Month",
                            style: secondaryTextStyle(color: primaryColor)),
                      )
                    ] else ...[
                      SizedBox.shrink()
                    ],
                  ],
                ).expand(),
                SizedBox(width: 4),
                Column(
                  children: [
                    Text('2d', style: secondaryTextStyle()),
                    SizedBox(height: 12),
                    Icon(Entypo.dots_three_vertical,
                            size: 14, color: textSecondaryColorGlobal)
                        .onTap(() {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25))),
                          builder: (c) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: 16, left: 16, top: 20, bottom: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 5,
                                    width: 50,
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: radius(), color: grey2),
                                  ),
                                  bottomSheetComponent(AntDesign.delete,
                                      "Delete", "Delete this notification", () {
                                    finish(context);
                                  }),
                                  bottomSheetComponent(
                                          AntDesign.closecircle,
                                          "Mute ${notificationsList[index].name} ",
                                          "Stop seeing ${notificationsList[index].name}'s update",
                                          () {})
                                      .visible(
                                          !notificationsList[index].isJob &&
                                              !notificationsList[index]
                                                  .profileView),
                                  bottomSheetComponent(
                                      FontAwesome.bell_slash_o,
                                      "Turn off",
                                      "Stop seeing notification like this",
                                      () {}),
                                  bottomSheetComponent(Ionicons.settings_sharp,
                                      "View setting", "", () {
                                    NotificationViewSetting().launch(context);
                                  }),
                                ],
                              ),
                            );
                          });
                    }),
                  ],
                ).paddingOnly(right: 12)
              ],
            ),
          );
        },
      ),
    );
  }
}
