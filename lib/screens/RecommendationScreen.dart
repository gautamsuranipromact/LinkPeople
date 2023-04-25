import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../components/NetworkItem.dart';
import '../components/SuggestedPageComponent.dart';
import '../utils/AppColors.dart';
import '../utils/AppDataProvider.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/Constants.dart';
import 'ViewPeopleScreen.dart';

class RecommendationScreen extends StatefulWidget {
  final bool? isPage;
  final bool? isPeople;
  final bool? isInvitation;

  RecommendationScreen(
      {this.isPage = false, this.isPeople = false, this.isInvitation = false});

  @override
  _RecommendationScreenState createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
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
      appBar: appBarCommon(context, "Recommendation", () {
        finish(context);
      }),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: widget.isPeople == true
            ? ListView.builder(
                itemCount: invitationUsers.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      ViewPeopleScreen().launch(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: context.dividerColor, width: 0.8),
                          color: context.scaffoldBackgroundColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14)),
                            ),
                            height: 130,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(14),
                                            topRight: Radius.circular(14)),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(ic_bg))),
                                    height: 75,
                                    width: context.width(),
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  left: 13,
                                  bottom: 0,
                                  child: Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: context.cardColor,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                invitationUsers[index]
                                                    .imageUrl
                                                    .toString()))),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      invitationUsers[index].isFollow = true;
                                      setState(() {});
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          border: Border.all(
                                              width: 0.8,
                                              color: invitationUsers[index]
                                                          .isFollow ==
                                                      true
                                                  ? textSecondaryColorGlobal
                                                  : primaryColor)),
                                      child: invitationUsers[index].isFollow ==
                                              false
                                          ? Text("Follow",
                                              style: primaryTextStyle(
                                                  color: primaryColor))
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.check,
                                                    size: 20,
                                                    color:
                                                        textSecondaryColorGlobal),
                                                Text('following',
                                                    style: primaryTextStyle(
                                                        color:
                                                            textSecondaryColorGlobal)),
                                              ],
                                            ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12, bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(invitationUsers[index].name.toString(),
                                    style: boldTextStyle()),
                                SizedBox(height: 6),
                                Container(
                                    child: Text(
                                        invitationUsers[index]
                                            .profession
                                            .toString(),
                                        style: secondaryTextStyle(),
                                        maxLines: 2,
                                        textAlign: TextAlign.center)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : widget.isPage == true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pages you may like", style: primaryTextStyle()),
                      SizedBox(height: 16),
                      AlignedGridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pagesList.length,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 10,
                        itemBuilder: (context, index) {
                          return SuggestedPageComponent(pagesList[index]);
                        },
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                          "People you may know from JIET Group of Institutions Jodhpur",
                          style: primaryTextStyle()),
                      SizedBox(height: 16),
                      AlignedGridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: invitationUsers.length,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 10,
                        itemBuilder: (context, index) {
                          return NetworkItem(
                              image: invitationUsers[index].imageUrl.toString(),
                              name: invitationUsers[index].name.toString(),
                              profession:
                                  invitationUsers[index].profession.toString(),
                              mutual: invitationUsers[index]
                                  .mutualFriends!
                                  .toInt());
                        },
                      ),
                    ],
                  ),
      ),
    );
  }
}
