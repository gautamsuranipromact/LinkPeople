import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import '../screens/AddSkillsScreen.dart';
import '../screens/SkillAssessmentsScreen.dart';
import '../screens/SkillsEditScreen.dart';
import '../utils/AppColors.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

List<String> skillList = ["Flutter", "Web Development", "Android"];
Widget skillProfileBox(BuildContext context, {isUser = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            Expanded(child: Text("Skills", style: boldTextStyle())),
            Visibility(
              visible: isUser,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      SkillAssessmentsScreen().launch(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(color: context.scaffoldBackgroundColor, border: Border.all(width: 1, color: primaryColor), borderRadius: radius(16)),
                      child: Text('Take skill quiz', style: primaryTextStyle(color: primaryColor, size: 14)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        AddSkillsScreen().launch(context);
                      },
                      icon: Icon(Icons.add, color: textSecondaryColorGlobal)),
                  IconButton(
                      onPressed: () {
                        SkillsEditScreen().launch(context);
                      },
                      icon: Icon(Icons.edit, color: textSecondaryColorGlobal)),
                ],
              ),
            ),
          ],
        ),
      ),
      skillListComponent(),
      Divider(thickness: 1),
      Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Show all", style: secondaryTextStyle()),
                Icon(Icons.arrow_forward, size: 18, color: textSecondaryColorGlobal),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 20)
    ],
  );
}

Widget skillListComponent({bool isEdit = false}) {
  return ListView.separated(
    itemCount: skillList.length,
    shrinkWrap: true,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    physics: NeverScrollableScrollPhysics(),
    separatorBuilder: (BuildContext context, int index) {
      return Divider(thickness: 1,height: isEdit==false?30:10);
    },
    itemBuilder: (BuildContext context, int index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(skillList[index], style: primaryTextStyle()),
          Visibility(visible: isEdit, child: IconButton(onPressed: () {}, icon: Icon(Icons.edit, color: textSecondaryColorGlobal))),
        ],
      );
    },
  );
}
