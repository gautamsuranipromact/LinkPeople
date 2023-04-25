import 'package:flutter/material.dart';
import 'package:link_people/screens/ManageMyNetworkScreen.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../components/InvitationReceiveComponent.dart';
import '../components/PageComponent.dart';
import '../components/SuggestedPeopleComponent.dart';
import '../components/recommendedPagesComponent.dart';
import '../screens/AllInvitationsScreen.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/text_styles.dart';

class MyNetworkScreen extends StatefulWidget {
  @override
  _MyNetworkScreenState createState() => _MyNetworkScreenState();
}

class _MyNetworkScreenState extends State<MyNetworkScreen> {
  bool isFollow = false;

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
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              ManageMyNetworkScreen().launch(context);
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 12),
              margin: EdgeInsets.only(bottom: 6),
              color: context.scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Manage my network",
                      style: boldTextStyle(color: primaryColor)),
                  Icon(Icons.chevron_right, color: grey2),
                ],
              ),
            ),
          ),
          Divider(height: 7.0, thickness: 7.0),
          //Invitations
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            color: context.scaffoldBackgroundColor,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AllInvitationsScreen().launch(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Invitations",
                            style: boldTextStyle(color: primaryColor)),
                        Icon(Icons.chevron_right, color: grey2),
                      ],
                    ),
                  ),
                ),
                Divider(height: 2, thickness: 1, color: context.dividerColor),
                ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: context.dividerColor, thickness: 1);
                  },
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return invitationTile(
                        invitationUsers[index].name.toString(),
                        invitationUsers[index].imageUrl.toString(),
                        invitationUsers[index].profession.toString(),
                        invitationUsers[index].mutualFriends!.toInt(),
                        context);
                  },
                ),
                Divider(color: context.dividerColor, thickness: 2, height: 0),
                GestureDetector(
                  onTap: () {
                    AllInvitationsScreen().launch(context);
                  },
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    color: context.scaffoldBackgroundColor,
                    child: Text("Show more",
                        style: boldTextStyle(color: primaryColor)),
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 7.0, thickness: 7.0),
          SuggestedPeopleComponent(
              text: "People you may know from Spark Foundation", count: 4),
          Divider(height: 7, thickness: 7),
          SuggestedPeopleComponent(
              text: "Software Engineer you may know", count: 4),
          Divider(height: 7, thickness: 7),

          //recommended pages
          RecommendedPagesComponent(),
          Divider(height: 7.0, thickness: 7.0),

          //recommended invitations
          Container(
            decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("People you may know", style: primaryTextStyle()),
                ),
                PageComponent(invitationUsers),
              ],
            ),
          ),
          Divider(height: 7.0, thickness: 7.0),
          SuggestedPeopleComponent(
              text: "Software Engineer you may know",
              count: invitationUsers.length)
        ],
      ),
    );
  }
}
