import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../utils/Extensions/text_styles.dart';

class AddSkillsScreen extends StatefulWidget {
  @override
  _AddSkillsScreenState createState() => _AddSkillsScreenState();
}

class _AddSkillsScreenState extends State<AddSkillsScreen> {
  List<String> skillList = [
    "Web Development",
    "Software Testing",
    "Java",
    "Application Development",
    "Networking",
    "Software Development Life Cycle (SDLC)",
    "Software Design",
    "Full-Stack Development",
    "Flutter",
    "Software"
  ];

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
      appBar: appBarCommon(context, "", () {},
          leading: IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.close)),
          elevation: 0.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add skills', style: primaryTextStyle()),
                SizedBox(height: 12),
                Text('* indicates required', style: secondaryTextStyle()),
                SizedBox(height: 20),
                Text('Suggested skills based on your profile',
                    style: secondaryTextStyle()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Wrap(
              children: skillList
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.all(6),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: radius(16),
                          border: Border.all(
                              width: 0.6, color: textSecondaryColorGlobal)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(e, style: primaryTextStyle()),
                          Icon(Icons.add,
                              color: textSecondaryColorGlobal, size: 18),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                borderRadius: radius(16),
                border: Border.all(width: 0.6, color: primaryColor)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Add another skill",
                    style: primaryTextStyle(color: primaryColor)),
                Icon(Icons.add, color: primaryColor, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
