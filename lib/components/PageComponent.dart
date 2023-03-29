import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import '../models/InvitationUsersModel.dart';
import '../screens/RecommendationScreen.dart';
import '../screens/ViewPeopleScreen.dart';
import '../utils/AppColors.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

class PageComponent extends StatefulWidget {
  final List<InvitationUsers> invitationUsers;

  PageComponent(this.invitationUsers);

  @override
  _PageComponentState createState() => _PageComponentState();
}

class _PageComponentState extends State<PageComponent> {
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
    return Column(
      children: [
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                ViewPeopleScreen().launch(context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(color: context.dividerColor, width: 0.8), color: context.scaffoldBackgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
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
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)), image: DecorationImage(fit: BoxFit.fill, image: AssetImage(ic_bg))),
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
                              decoration: BoxDecoration(color: context.cardColor, shape: BoxShape.circle, image: DecorationImage(image: AssetImage(widget.invitationUsers[index].imageUrl.toString()))),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                widget.invitationUsers[index].isFollow = true;
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(width: 0.8, color: widget.invitationUsers[index].isFollow == true ? textSecondaryColorGlobal : primaryColor)),
                                child: widget.invitationUsers[index].isFollow == false
                                    ? Text("Follow", style: primaryTextStyle(color: primaryColor))
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.check, size: 20, color: textSecondaryColorGlobal),
                                          Text('following', style: primaryTextStyle(color: textSecondaryColorGlobal)),
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
                          Text(widget.invitationUsers[index].name.toString(), style: boldTextStyle()),
                          SizedBox(height: 6),
                          Container(child: Text(widget.invitationUsers[index].profession.toString(), style: secondaryTextStyle(), maxLines: 2, textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            RecommendationScreen(isPeople: true).launch(context);
          },
          child: Text("See all", style: boldTextStyle(color: primaryColor)),
        ),
      ],
    );
  }
}
