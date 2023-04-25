import 'package:flutter/material.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../models/SkillModel.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/Constants.dart';

class SkillAssessmentsScreen extends StatefulWidget {
  @override
  _SkillAssessmentsScreenState createState() => _SkillAssessmentsScreenState();
}

class _SkillAssessmentsScreenState extends State<SkillAssessmentsScreen> {
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
      backgroundColor: context.dividerColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.iconColor),
        backgroundColor: context.scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        elevation: 0.5,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Icon(Icons.search, color: textSecondaryColorGlobal, size: 18),
                Text('Search all assessments', style: secondaryTextStyle()),
              ],
            ),
            Divider(
                height: 6,
                thickness: 1,
                color: textSecondaryColorGlobal,
                endIndent: 10)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8),
              color: context.scaffoldBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12, bottom: 8, top: 20),
                    child: Text('Skill Assessments ', style: boldTextStyle()),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 12, bottom: 8),
                          child: Text(
                              'Check your skill level answer 15 multiple choice questions,score in the top 30%, and earn a skill badge. ',
                              style: secondaryTextStyle()),
                        ),
                      ),
                      Image.asset(ic_skillAssessment,
                          height: 170, width: 170, fit: BoxFit.fill),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              color: context.scaffoldBackgroundColor,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: skillList.length,
                physics: NeverScrollableScrollPhysics(),
                primary: true,
                padding: EdgeInsets.all(4),
                itemBuilder: (context, i) {
                  SkillModel data = skillList[i];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(6),
                            color: Colors.grey.withOpacity(0.5),
                            child: Image.asset(data.image.toString(),
                                height: 35, width: 35, fit: BoxFit.cover)),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.name.toString(),
                                  style: boldTextStyle()),
                              SizedBox(height: 4),
                              Text('Topics: ${data.subText}',
                                  style: secondaryTextStyle(),
                                  overflow: TextOverflow.ellipsis),
                              SizedBox(height: 4),
                              Text('${data.people} people took this',
                                  style: secondaryTextStyle(),
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(thickness: 1, height: 20);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
