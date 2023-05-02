import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../components/JobListComponent.dart';
import '../utils/Extensions/text_styles.dart';

class JobDetailScreen extends StatefulWidget {
  final String? name;
  final String? cName;
  final String? img;

  JobDetailScreen({this.name, this.cName, this.img});

  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
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
      appBar: appBarCommon(
        context,
        "",
        () {},
        leading: IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.close)),
        action: [
          PopupMenuButton(
            padding: EdgeInsets.all(8),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(EvilIcons.sc_telegram,
                        color: textSecondaryColorGlobal),
                    SizedBox(width: 4),
                    Text("Share via private message",
                        style: secondaryTextStyle()),
                  ],
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(Entypo.share, color: textSecondaryColorGlobal),
                    SizedBox(width: 4),
                    Text("Share job", style: secondaryTextStyle()),
                  ],
                ),
                value: 2,
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Icon(MaterialCommunityIcons.flag_variant,
                        color: textSecondaryColorGlobal),
                    SizedBox(width: 4),
                    Text("Report this job", style: secondaryTextStyle()),
                  ],
                ),
                value: 2,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name.toString(), style: boldTextStyle(size: 30)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(widget.img.toString(), width: 35, height: 35),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.cName.toString(),
                              style: primaryTextStyle()),
                          Text('India(Remote)', style: primaryTextStyle()),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('13 day ago', style: secondaryTextStyle()),
                      Icon(Entypo.dot_single),
                      Text('17 applicants',
                          style: boldTextStyle(size: 14, color: greenColor)),
                    ],
                  ),
                ],
              ),
            ),
            component(MaterialIcons.work, 'Full-time'),
            component(MaterialIcons.local_post_office, '11-50 employees'),
            component(FontAwesome.user_circle_o,
                'Anjali Tiwari is hiring for this job'),
            component(MaterialCommunityIcons.lightbulb_on_outline,
                'see recent hiring trends for arity infoway.'),
            component(Feather.check_circle, 'Actively recruiting',
                color: greenColor),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: primaryColor),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ic_appLogo, height: 18, width: 18),
                          SizedBox(width: 5),
                          Text("Easy Apply",
                              style: boldTextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: reactionColor),
                          borderRadius: BorderRadius.circular(22)),
                      child: Text("Add Section",
                          style: primaryTextStyle(
                              color: textSecondaryColorGlobal)),
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 5, color: context.dividerColor),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Job description', style: boldTextStyle()),
                  SizedBox(height: 12),
                  Text(
                      'we are looking for android flutter developer for our company.candidate must have atlist 1 year of experience.',
                      style: primaryTextStyle()),
                ],
              ),
            ),
            Divider(thickness: 5, color: context.dividerColor),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reach out to the job poster', style: boldTextStyle()),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage(ic_man2), maxRadius: 25),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shreyansh Gupta', style: primaryTextStyle()),
                          Text('HR Manager', style: primaryTextStyle()),
                        ],
                      ),
                    ],
                  ),
                  Divider(thickness: 1),
                  SizedBox(height: 8),
                  Center(
                      child: Text('Send Mail',
                          style: boldTextStyle(color: primaryColor))),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Divider(thickness: 5, color: context.dividerColor),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pay range unavailable', style: boldTextStyle()),
                  SizedBox(height: 12),
                  Text('Salary information is not available at the moment.',
                      style: secondaryTextStyle()),
                ],
              ),
            ),
            Container(
              color: primaryColor.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                          'Are you interested in salary information for this job?',
                          style: secondaryTextStyle())),
                  Text('Yes / No', style: secondaryTextStyle()),
                ],
              ),
            ),
            Divider(thickness: 5, color: context.dividerColor, height: 0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text('About the company', style: boldTextStyle()),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Image.asset(widget.img.toString(), width: 35, height: 35),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Arity Infoway', style: primaryTextStyle()),
                            Text('153 followers', style: primaryTextStyle()),
                          ],
                        ),
                      ),
                      Text('+ Follow',
                          style:
                              boldTextStyle(color: textSecondaryColorGlobal)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                      'Information Technology & Services • 11 - 50 employees • 19 on Find My CoFounder',
                      style: primaryTextStyle(size: 14)),
                  SizedBox(height: 20),
                  Text(
                      'Arity Infoway is an India based outsourcing company providing services all over the world. The services provided by Arity Infoway are various like Web...',
                      style: primaryTextStyle(size: 14)),
                  Text('Show more',
                      style: boldTextStyle(color: textSecondaryColorGlobal)),
                ],
              ),
            ),
            Divider(thickness: 5, color: context.dividerColor),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Similar Pages', style: boldTextStyle()),
                  SizedBox(height: 12),
                  jobList(() {
                    setState(() {});
                  }),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  component(icon, text, {color}) {
    return ListTile(
      dense: true,
      minLeadingWidth: 30,
      contentPadding: EdgeInsets.only(left: 12),
      horizontalTitleGap: 0,
      minVerticalPadding: 0,
      leading: Icon(icon, color: color ?? textSecondaryColorGlobal, size: 18),
      title: Text(text, style: primaryTextStyle()),
    );
  }
}
