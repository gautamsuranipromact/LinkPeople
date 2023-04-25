import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/screens/AddSkillsScreen.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../components/SkillListComponent.dart';
import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';
import 'SkillAssessmentsScreen.dart';

class SkillsEditScreen extends StatefulWidget {
  @override
  _SkillsEditScreenState createState() => _SkillsEditScreenState();
}

class _SkillsEditScreenState extends State<SkillsEditScreen> {
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
        appBar: appBarCommon(context, "Skills", () {
          finish(context);
        }, action: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    builder: (_) {
                      return Container(
                        padding: EdgeInsets.only(
                            right: 16, left: 16, top: 20, bottom: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: radiusCircular(16),
                                topRight: radiusCircular(16))),
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
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Icon(MaterialIcons.reorder,
                                      color: textSecondaryColorGlobal,
                                      size: 22),
                                  SizedBox(width: 12),
                                  Text("Reorder",
                                      style: primaryTextStyle(
                                          color: textSecondaryColorGlobal)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Icon(MaterialIcons.settings,
                                      color: textSecondaryColorGlobal,
                                      size: 22),
                                  SizedBox(width: 12),
                                  Text("Endorsement setting",
                                      style: primaryTextStyle(
                                          color: textSecondaryColorGlobal)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              icon: Icon(Entypo.dots_three_vertical,
                  size: 20, color: textSecondaryColorGlobal)),
          IconButton(
              onPressed: () {
                AddSkillsScreen().launch(context);
              },
              icon: Icon(Icons.add, color: textSecondaryColorGlobal))
        ]),
        body: Column(
          children: [
            Container(
              height: 50,
              width: context.width(),
              child: TabBar(
                onTap: (i) {
                  currentIndex = i;
                  setState(() {});
                },
                labelColor: Colors.white,
                indicatorColor: greenColor,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                unselectedLabelStyle: secondaryTextStyle(),
                unselectedLabelColor: textSecondaryColorGlobal,
                tabs: [
                  Tab(
                      child: Text('All',
                          style: primaryTextStyle(
                              color: textSecondaryColorGlobal, size: 14))),
                  Tab(
                    child: Text('Industry',
                        style: primaryTextStyle(
                            color: textSecondaryColorGlobal, size: 14)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: context.scaffoldBackgroundColor,
                child: TabBarView(
                  children: [
                    skillListComponent(isEdit: true),
                    skillListComponent(isEdit: true),
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            SkillAssessmentsScreen().launch(context);
          },
          child: Container(
            alignment: Alignment.center,
            width: context.width(),
            height: 35,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration:
                BoxDecoration(color: primaryColor, borderRadius: radius(30)),
            child: Text("Take  skill quiz",
                style: boldTextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
