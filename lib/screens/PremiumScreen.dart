import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppColors.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

class PremiumScreen extends StatefulWidget {
  @override
  _PremiumScreenState createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  int? currentTimeValue = 0;
  List checkListItems = [
    {
      "id": 0,
      "value": true,
      "title": "To job search with confidence and get hired",
    },
    {
      "id": 0,
      "value": false,
      "title": "To develop my profession skills",
    },
    {
      "id": 0,
      "value": false,
      "title": "To grow my network or manage my reputation",
    },
    {
      "id": 0,
      "value": false,
      "title": "To find leads more effectively",
    },
    {
      "id": 0,
      "value": false,
      "title": "To find and hire talent faster",
    }
  ];

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
      appBar: AppBar(
        backgroundColor: context.scaffoldBackgroundColor,
        elevation: 1.5,
        leading: GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Icon(Icons.close, color: textSecondaryColorGlobal)),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Ionicons.square, color: tanColor, size: 18),
                    SizedBox(width: 6),
                    Text('Premium'.toUpperCase(),
                        style: boldTextStyle(letterSpacing: 4)),
                  ],
                ),
                SizedBox(height: 16),
                Text('Muskan, how would you like Premium to help?',
                    style: boldTextStyle()),
                SizedBox(height: 8),
                Text("We'll recommend the right plan for you",
                    style: secondaryTextStyle()),
                SizedBox(height: 40),
                Column(
                  children: List.generate(
                    checkListItems.length,
                    (index) => CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      side: BorderSide(color: textSecondaryColorGlobal),
                      contentPadding: EdgeInsets.all(0),
                      dense: true,
                      title: Text(checkListItems[index]["title"],
                          style: secondaryTextStyle()),
                      value: checkListItems[index]["value"],
                      onChanged: (value) {
                        setState(() {
                          checkListItems[index]["value"] = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: context.width(),
                  margin: EdgeInsets.all(8),
                  decoration: boxDecorationWithShadowWidget(
                      backgroundColor: grey2.withOpacity(0.02),
                      borderRadius: radius(30),
                      blurRadius: 0,
                      spreadRadius: 0),
                  child: Text('Next', style: secondaryTextStyle()),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: context.width(),
                  margin: EdgeInsets.all(8),
                  decoration: boxDecorationWithShadowWidget(
                      backgroundColor: context.scaffoldBackgroundColor,
                      borderRadius: radius(30),
                      blurRadius: 0,
                      spreadRadius: 0,
                      border: Border.all(width: 1, color: primaryColor)),
                  child: Text('See plans',
                      style: primaryTextStyle(color: primaryColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
