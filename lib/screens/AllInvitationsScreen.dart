import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../components/InvitationReceiveComponent.dart';
import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

class AllInvitationsScreen extends StatefulWidget {
  @override
  _AllInvitationsScreenState createState() => _AllInvitationsScreenState();
}

class _AllInvitationsScreenState extends State<AllInvitationsScreen> {
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
        appBar: appBarCommon(context, "Invitations", () {
          finish(context);
        }, elevation: 0.5, action: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    isScrollControlled: true,
                    builder: (c) {
                      return Container(
                        padding: EdgeInsets.only(
                            right: 16, left: 16, top: 20, bottom: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: radiusCircular(16),
                                topRight: radiusCircular(16))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 5,
                                width: 50,
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: radius(), color: grey2),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text('Invitation Setting',
                                    style: boldTextStyle())),
                            TextButton(
                              onPressed: () {},
                              child: Text('Choose who can connect with you',
                                  style: secondaryTextStyle()),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Choose what invitations to receive',
                                  style: secondaryTextStyle()),
                            )
                          ],
                        ),
                      );
                    });
              },
              icon: Icon(Ionicons.settings_sharp))
        ]),
        body: Column(
          children: [
            Container(
              height: 50,
              width: context.width(),
              color: context.dividerColor,
              child: TabBar(
                onTap: (i) {
                  currentIndex = i;
                  setState(() {});
                },
                indicatorColor: greenColor,
                labelColor: greenColor,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                unselectedLabelStyle: secondaryTextStyle(),
                unselectedLabelColor: textSecondaryColorGlobal,
                tabs: [
                  Tab(text: "Received"),
                  Tab(text: "Sent"),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(children: [
              receiveComponent(context),
              receiveComponent(context, isSent: true)
            ]))
          ],
        ),
      ),
    );
  }
}

receiveComponent(BuildContext context, {bool isSent = false}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: 50,
          width: context.width(),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 70,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: radius(20), color: greenColor),
                child: Text('All(12)',
                    style: primaryTextStyle(color: Colors.white)),
              ).visible(isSent == false),
              SizedBox(width: 12).visible(isSent == false),
              Container(
                height: 30,
                width: 120,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration:
                    BoxDecoration(borderRadius: radius(20), color: greenColor),
                child: Text('People(2)',
                    style: primaryTextStyle(color: Colors.white)),
              ),
              SizedBox(width: 12),
              Container(
                height: 30,
                width: 70,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: radius(20), color: greenColor),
                child: Text('Pages(0)',
                    style: primaryTextStyle(color: Colors.white)),
              ).visible(isSent),
              SizedBox(width: 12).visible(isSent),
              Container(
                height: 30,
                width: 70,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: radius(20), color: greenColor),
                child: Text('Events(0)',
                    style: primaryTextStyle(color: Colors.white)),
              ).visible(isSent),
            ],
          ),
        ),
        Divider(thickness: 1),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: context.dividerColor, thickness: 1);
          },
          itemCount: isSent ? 2 : invitationUsers.length,
          shrinkWrap: true,
          primary: true,
          itemBuilder: (BuildContext context, int index) {
            if (isSent)
              return invitationTile(
                  invitationUsers[index % 2].name.toString(),
                  invitationUsers[index % 2].imageUrl.toString(),
                  invitationUsers[index % 2].profession.toString(),
                  invitationUsers[index % 2].mutualFriends!.toInt(),
                  context,
                  isSent: isSent);
            else
              return invitationTile(
                  invitationUsers[index].name.toString(),
                  invitationUsers[index].imageUrl.toString(),
                  invitationUsers[index].profession.toString(),
                  invitationUsers[index].mutualFriends!.toInt(),
                  context,
                  isSent: isSent);
          },
        ),
      ],
    ),
  );
}
