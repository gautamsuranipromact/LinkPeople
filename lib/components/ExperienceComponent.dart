import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../screens/AddOrEditEducationScreen.dart';
import '../screens/EducationScreen.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/text_styles.dart';

Widget experienceBox(BuildContext context, {isUser = false}) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text("Experience", style: boldTextStyle())),
            Visibility(
              visible: isUser,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        AddOrEditEducationScreen(isExperience: true)
                            .launch(context);
                      },
                      icon: Icon(Icons.add, color: textSecondaryColorGlobal)),
                  IconButton(
                      onPressed: () {
                        EducationScreen(isExperience: true).launch(context);
                      },
                      icon: Icon(Icons.edit, color: textSecondaryColorGlobal)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        experienceComponent(context, isEdit: false)
      ],
    ),
  );
}

Widget experienceComponent(BuildContext context, {bool isEdit = false}) {
  return Container(
    width: context.width(),
    child: ListView.separated(
      itemCount: experienceList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 30, thickness: 1);
      },
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: context.dividerColor,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(experienceList[index].image.toString())),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(experienceList[index].name.toString(),
                      style: boldTextStyle()),
                  SizedBox(height: 4),
                  Text(experienceList[index].description.toString(),
                      style: primaryTextStyle()),
                  SizedBox(height: 4),
                  Text(experienceList[index].time.toString(),
                      style: secondaryTextStyle())
                ],
              ),
            ),
            Visibility(
                visible: isEdit,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: textSecondaryColorGlobal))),
          ],
        );
      },
    ),
  );
}
