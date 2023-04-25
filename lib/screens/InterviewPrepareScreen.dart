import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../models/WalkThroughModel.dart';
import '../utils/AppDataProvider.dart';
import 'CategoryQueScreen.dart';
import 'QuestionsDetailScreen.dart';

class InterviewPrepareScreen extends StatefulWidget {
  @override
  _InterviewPrepareScreenState createState() => _InterviewPrepareScreenState();
}

class _InterviewPrepareScreenState extends State<InterviewPrepareScreen> {
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 110.0,
              floating: true,
              pinned: true,
              elevation: 2,
              backgroundColor: context.scaffoldBackgroundColor,
              iconTheme: IconThemeData(color: context.iconColor),
              automaticallyImplyLeading: true,
              flexibleSpace: FlexibleSpaceBar(
                title:
                    Text("Prepare for an interview", style: primaryTextStyle()),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Common Questions', style: primaryTextStyle()),
                        GestureDetector(
                          onTap: () {
                            CategoryQueScreen().launch(context,
                                pageRouteAnimation:
                                    PageRouteAnimation.SlideBottomTop);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                color: primaryColor, borderRadius: radius(16)),
                            child: Text('Categories',
                                style: boldTextStyle(
                                    color: Colors.white, size: 12)),
                          ),
                        )
                      ],
                    ),
                    Text('26 questions', style: secondaryTextStyle()),
                  ],
                ),
              ),
              Divider(thickness: 1),
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  primary: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: interviewQueList.length,
                  itemBuilder: (context, i) {
                    WalkThroughModel data = interviewQueList[i];
                    return GestureDetector(
                      onTap: () {
                        QuestionsDetailScreen(text: data.text.toString())
                            .launch(context);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Row(children: [
                          Text("0" + data.index.toString(),
                              style: secondaryTextStyle()),
                          SizedBox(width: 8),
                          Image.asset(data.img.toString(),
                              height: 50, width: 50, fit: BoxFit.cover),
                          SizedBox(width: 8),
                          Expanded(
                              child: Text(data.text.toString(),
                                  style: primaryTextStyle())),
                        ]),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
