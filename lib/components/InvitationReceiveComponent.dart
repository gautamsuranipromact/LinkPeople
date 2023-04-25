import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../screens/ViewPeopleScreen.dart';

Widget invitationTile(String name, String imageUrl, String profession,
    int mutual, BuildContext context,
    {bool isSent = false}) {
  return GestureDetector(
    onTap: () {
      ViewPeopleScreen().launch(context);
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              maxRadius: 34,
              backgroundColor: context.cardColor),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(name, style: boldTextStyle()),
                SizedBox(height: 2),
                Text(profession,
                    style: secondaryTextStyle(size: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    Icon(Icons.link, color: grey2, size: 18),
                    SizedBox(width: 4),
                    Expanded(
                        child: Text(mutual.toString() + " mutual connection",
                            style: secondaryTextStyle(size: 12), maxLines: 1)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 4),
          isSent == true
              ? TextButton(
                  onPressed: () {},
                  child: Text('Withdraw', style: secondaryTextStyle()),
                )
              : Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: context.scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 0.8, color: textSecondaryColorGlobal)),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.clear,
                            size: 24, color: textSecondaryColorGlobal),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.8, color: primaryColor)),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.done, size: 24, color: primaryColor),
                      ),
                    ),
                  ],
                )
        ],
      ),
    ),
  );
}
