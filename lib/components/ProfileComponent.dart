import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/screens/ProfileScreen.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import 'package:styled_text/styled_text.dart';

import '../models/ProfileAnalyticModel.dart';
import '../screens/AddOrEditEducationScreen.dart';
import '../screens/EducationScreen.dart';
import '../utils/AppColors.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/text_styles.dart';
import 'EducationComponent.dart';

List<String> languageList = ["English", "Sindhi", "Hindi"];

Widget profileAnalyticBox(List<ProfileAnalyticModel> profileAnalyticModel,
    BuildContext context, text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: boldTextStyle()),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.visibility, color: reactionColor, size: 18),
            SizedBox(width: 2),
            Text("Private To You", style: secondaryTextStyle(size: 12)),
          ],
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: profileAnalyticModel.length,
          padding: EdgeInsets.only(top: 20),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            ProfileAnalyticModel model = profileAnalyticModel[index];
            return Column(
              children: [
                Row(
                  children: [
                    Icon(model.icon, color: reactionColor),
                    SizedBox(width: 12),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.name.toString(), style: boldTextStyle()),
                          SizedBox(height: 3),
                          Text(model.description.toString(),
                              style: secondaryTextStyle()),
                        ],
                      ),
                    )
                  ],
                ),
                Visibility(
                    visible: profileAnalyticModel != pAnalyticList ||
                        index != pAnalyticList.length - 1,
                    child: Divider(thickness: 1, height: 30)),
              ],
            );
          },
        ),
        Visibility(
          visible: profileAnalyticModel != pAnalyticList,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Show all 5 resources", style: secondaryTextStyle()),
              Icon(Icons.arrow_forward,
                  size: 18, color: textSecondaryColorGlobal),
            ],
          ),
        )
      ],
    ),
  );
}

bottomSheetComponent(BuildContext context,
    {text, Function? onTap, IconData? icon, subtext, isSubtext = false}) {
  return GestureDetector(
    onTap: () {
      finish(context);
      onTap!();
    },
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: textSecondaryColorGlobal, size: 22)
              .visible(!isSubtext),
          SizedBox(width: 12).visible(!isSubtext),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text,
                    style: primaryTextStyle(color: textSecondaryColorGlobal)),
                subtext != null
                    ? Text(subtext,
                        style:
                            secondaryTextStyle(color: textSecondaryColorGlobal))
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget profileActivityBox(BuildContext context, {isUser = false}) {
  return Padding(
    padding: EdgeInsets.only(left: 16, top: 10, right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Activity", style: boldTextStyle()),
                SizedBox(height: 4),
                Text("12,224 followers",
                    style: boldTextStyle(size: 14, color: primaryColor)),
              ],
            ),
            Visibility(
              visible: isUser,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: context.scaffoldBackgroundColor,
                    border: Border.all(width: 1, color: primaryColor),
                    borderRadius: radius(16)),
                child: Text('Start a post',
                    style: primaryTextStyle(color: primaryColor, size: 14)),
              ),
            )
          ],
        ),
        ListView.separated(
          itemCount: 2,
          padding: EdgeInsets.only(top: 20, bottom: 10),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(thickness: 1, height: 30);
          },
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledText(
                  text: "<b>Prem Aaswani </b>commented on a post",
                  style: secondaryTextStyle(),
                  tags: {'b': StyledTextTag(style: boldTextStyle())},
                ),
                SizedBox(height: 4),
                Text("Congrats", style: boldTextStyle(size: 14)),
                SizedBox(height: 2),
                Text("7.14 comments", style: secondaryTextStyle())
              ],
            );
          },
        ),
        Container(
          color: context.scaffoldBackgroundColor,
          width: context.width(),
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Show all Activity", style: secondaryTextStyle()),
              Icon(Icons.arrow_forward,
                  size: 18, color: textSecondaryColorGlobal),
            ],
          ),
        )
      ],
    ),
  );
}

Widget profileEducationBox(BuildContext context, {isUser = false}) {
  return Padding(
    padding: EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text("Education", style: boldTextStyle())),
            Visibility(
              visible: isUser,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        AddOrEditEducationScreen().launch(context);
                      },
                      icon: Icon(Icons.add, color: textSecondaryColorGlobal)),
                  IconButton(
                      onPressed: () {
                        EducationScreen().launch(context);
                      },
                      icon: Icon(Icons.edit, color: textSecondaryColorGlobal)),
                ],
              ),
            ),
          ],
        ),
        educationComponent(isEdit: false)
      ],
    ),
  );
}

Widget peopleAlsoView(BuildContext context, onTap) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text('People also view', style: boldTextStyle()).paddingLeft(8),
        SizedBox(height: 8),
        ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          primary: true,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: invitationUsers.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                ProfileScreen().launch(context);
/*
                ViewProfileScreen(
                        image: invitationUsers[i].imageUrl.toString(),
                        name: invitationUsers[i].name.toString())
                    .launch(context,
                        pageRouteAnimation: PageRouteAnimation.Slide);
*/
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                        maxRadius: 30,
                        backgroundColor: context.cardColor,
                        backgroundImage:
                            AssetImage(invitationUsers[i].imageUrl.toString())),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(invitationUsers[i].name.toString(),
                              style: primaryTextStyle(
                                  color: textSecondaryColorGlobal)),
                          Text(invitationUsers[i].profession.toString(),
                              style: secondaryTextStyle(
                                  color: textSecondaryColorGlobal)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        invitationUsers[i].isInvite = true;
                        onTap();
                      },
                      child: invitationUsers[i].isInvite == true
                          ? Text('Invited', style: secondaryTextStyle())
                          : Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: context.scaffoldBackgroundColor,
                                  border: Border.all(
                                      width: 1,
                                      color: textSecondaryColorGlobal)),
                              child: Icon(FontAwesome.user_plus,
                                  color: textSecondaryColorGlobal, size: 18),
                            ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}
