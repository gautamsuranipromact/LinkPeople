import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../models/AnwserModel.dart';
import '../utils/AppColors.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

class QuestionsDetailScreen extends StatefulWidget {
  final String? text;

  QuestionsDetailScreen({this.text});

  @override
  _QuestionsDetailScreenState createState() => _QuestionsDetailScreenState();
}

class _QuestionsDetailScreenState extends State<QuestionsDetailScreen> {
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
              expandedHeight: 80.0,
              floating: true,
              pinned: true,
              elevation: 2,
              title: innerBoxIsScrolled == true ? Text(widget.text.toString(), style: primaryTextStyle()) : SizedBox(),
              backgroundColor: context.scaffoldBackgroundColor,
              iconTheme: IconThemeData(color: context.iconColor),
              automaticallyImplyLeading: true,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.text.toString(), style: boldTextStyle(size: 18)),
                    Text('Common Questions', style: primaryTextStyle()),
                  ],
                ),
              ),
              Divider(thickness: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overview', style: primaryTextStyle()),
                    Text(
                        'A lot of jobs require someone who can think on their feet or present ideas with crispness '
                        'and clarity. This question provides employers with '
                        'an early preview of your core skills, your personality and your ability to '
                        'respond to an unstructured question.',
                        style: primaryTextStyle(size: 14)),
                  ],
                ),
              ),
              Divider(thickness: 5),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Unlock sample answers with expert feedback using LinkPeople Premium', style: primaryTextStyle()),
                    Container(
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.only(top: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: tanColor, borderRadius: radius(20)),
                      child: Text('Try Free for 1 Month', style: primaryTextStyle()),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 1),
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  primary: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ansList.length,
                  itemBuilder: (context, i) {
                    AnswerModel data = ansList[i];
                    return Container(
                      decoration: BoxDecoration(borderRadius: radius(6), border: Border.all(width: 0.5, color: textSecondaryColorGlobal)),
                      width: context.width(),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name.toString(), style: primaryTextStyle()),
                          Text(data.subtext.toString(), style: primaryTextStyle(size: 14)),
                          Text(data.view.toString(), style: secondaryTextStyle(size: 12)),
                          SizedBox(height: 6),
                          Text(data.text.toString(), style: secondaryTextStyle(size: 12)),
                        ],
                      ),
                    );
                  }),
              Divider(thickness: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Answer framework', style: boldTextStyle(size: 14)),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(borderRadius: radius(6), border: Border.all(width: 0.5, color: textSecondaryColorGlobal)),
                      width: context.width(),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('Images/people/men3.jpg', height: 50, width: 50, fit: BoxFit.cover),
                              Container(height: 50, width: 50, color: Colors.black26),
                              Icon(
                                Icons.play_circle_outline_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("How to approach this question", style: primaryTextStyle()),
                              Text("By Jenny Foss, Career Strategist", style: primaryTextStyle(size: 14)),
                              Text("2 min 2 secs • 2,252,358 views", style: secondaryTextStyle(size: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Text("This is something you'll be asked a lot at the beginning of an interview. Here are three tips that'll help you nail the opener.", style: primaryTextStyle(size: 14)),
                    SizedBox(height: 8),
                    Text('Be succinct, honest and engaging.', style: boldTextStyle(size: 14)),
                    Text(
                        'I call this the "SHE" formula, Resist the urge to give a detailed account of the last two decades of your career. The interviewer is looking for an answer that shows them...',
                        style: primaryTextStyle(size: 14)),
                  ],
                ),
              ),
              Divider(thickness: 1),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('See more', style: boldTextStyle(color: primaryColor), textAlign: TextAlign.center),
                ),
              ),
              Divider(thickness: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tips', style: primaryTextStyle()),
                    Html(
                      data: '<ul style="line-height:120%">'
                          '<li>Prepare for this question in advance and have a compelling story about your past experiences.</li>'
                          '<li> Pull prominent skills from the job description.</li>'
                          '<li>Be "SHE" (succinct, honest and engaging)</li>'
                          '</ul>',
                    ),
                  ],
                ),
              ),
              Divider(thickness: 5),
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(child: Text('Did you find this content helpful?', style: primaryTextStyle())),
                    IconButton(onPressed: () {}, icon: Icon(SimpleLineIcons.like, color: textSecondaryColorGlobal)),
                    IconButton(onPressed: () {}, icon: Icon(SimpleLineIcons.dislike, color: textSecondaryColorGlobal))
                  ],
                ),
              ),
              Divider(thickness: 5),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: context.width(),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: boxDecorationWithShadowWidget(backgroundColor: primaryColor, borderRadius: radius(30)),
              child: Text("Practice and get feedback", style: primaryTextStyle(color: Colors.white)),
            ),
            SizedBox(height: 12),
            Text('8,539,763 people viewed this question', style: secondaryTextStyle()),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
