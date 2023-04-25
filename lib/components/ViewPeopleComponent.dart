import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/screens/ProfileScreen.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppColors.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

class ViewPeopleComponent extends StatefulWidget {
  final String? image;
  final String? name;
  final String? profession;
  final int? mutual;
  final bool? isFull;

  ViewPeopleComponent(
      {Key? key,
      this.image,
      this.name,
      this.profession,
      this.mutual,
      this.isFull = false});

  @override
  _ViewPeopleComponentState createState() => _ViewPeopleComponentState();
}

class _ViewPeopleComponentState extends State<ViewPeopleComponent> {
  bool? isConnect = false;

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
    return Container(
      padding: EdgeInsets.only(bottom: 14),
      height: context.height(),
      margin: EdgeInsets.only(top: context.statusBarHeight + 15, right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: context.dividerColor, width: 1.5),
          color: context.cardColor),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Container(
              height: 140,
              width: context.width(),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Container(
                          decoration: BoxDecoration(
                              color: context.dividerColor,
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage(ic_bg))),
                          height: 100,
                          width: context.width()),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Image.asset(widget.image.toString())
                        .cornerRadiusWithClipRRect(50),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.name.toString(), style: boldTextStyle()),
                SizedBox(height: 6),
                Text(widget.profession.toString(),
                    style: secondaryTextStyle(size: 14),
                    maxLines: 2,
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 34,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    width: context.width(),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: context.scaffoldBackgroundColor,
                        border: Border.all(
                            width: 1, color: textSecondaryColorGlobal)),
                    child: Text("Dismiss",
                        style:
                            primaryTextStyle(color: textSecondaryColorGlobal)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      isConnect = true;
                      setState(() {});
                    },
                    child: Container(
                      height: 34,
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      alignment: Alignment.center,
                      width: context.width(),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isConnect == false
                                  ? primaryColor
                                  : textSecondaryColorGlobal,
                              width: 0.8),
                          color: isConnect == false
                              ? primaryColor
                              : context.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: isConnect == false
                          ? Text("Connect",
                              style: primaryTextStyle(color: Colors.white))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check,
                                    size: 20, color: textSecondaryColorGlobal),
                                Text('pending',
                                    style: primaryTextStyle(
                                        color: textSecondaryColorGlobal)),
                              ],
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text('Highlights', style: boldTextStyle()),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(FontAwesome.users,
                        color: textSecondaryColorGlobal, size: 18),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('11 mutual friends',
                              style: secondaryTextStyle()),
                          Text(
                              'you and Harshita Mathur, Purnima Jain,and 9 other',
                              style: secondaryTextStyle()),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Text('Latest experience', style: boldTextStyle()),
                SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(ic_profile1,
                        height: 40, width: 40, fit: BoxFit.cover),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Flutter developer', style: secondaryTextStyle()),
                        Text('amdocs It solution', style: secondaryTextStyle()),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Text('Education', style: boldTextStyle()),
                SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset("Images/pages/cover/ic_cover2.jpg",
                        height: 40, width: 40, fit: BoxFit.cover),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('JIET Group Of Institutions Jodhpur',
                            style: secondaryTextStyle()),
                        Text('Computer Engineering',
                            style: secondaryTextStyle()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ).expand(),
          Column(
            children: [
              Divider(),
              GestureDetector(
                  onTap: () {
                    ProfileScreen().launch(context);
/*
                    ViewProfileScreen(
                            name: widget.name.toString(),
                            image: widget.image.toString())
                        .launch(context);
*/
                  },
                  child: Text('View full profile',
                      style: primaryTextStyle(color: primaryColor))),
            ],
          ),
        ],
      ),
    );
  }
}
