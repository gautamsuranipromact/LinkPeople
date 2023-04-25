import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:styled_text/styled_text.dart';

import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/text_styles.dart';

class CreateAJobScreen extends StatefulWidget {
  @override
  _CreateAJobScreenState createState() => _CreateAJobScreenState();
}

class _CreateAJobScreenState extends State<CreateAJobScreen> {
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
      appBar: appBarCommon(context, "Create a job", () {
        finish(context);
      },
          leading: IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.close, color: textSecondaryColorGlobal)),
          action: [
            TextButton(
              onPressed: () {},
              child: Text('Done', style: secondaryTextStyle()),
            )
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text('Find a great hire, fast',
                style: primaryTextStyle(size: 14)),
          ),
          component("Job title", 'Add job title', AntDesign.pluscircleo, () {},
              primaryColor),
          component("Workplace type", 'on-site', Feather.edit_2, () {},
              textPrimaryColorGlobal),
          component("Job Location", 'Childersburg,United States',
              Feather.edit_2, () {}, textPrimaryColorGlobal),
          component("Company", 'Add company', AntDesign.pluscircleo, () {},
              primaryColor),
          component("Job type", 'Full-time', Feather.edit_2, () {},
              textPrimaryColorGlobal),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description*", style: primaryTextStyle()),
                SizedBox(height: 6),
                TextField(
                  cursorColor: textSecondaryColorGlobal,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintMaxLines: 2,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: textSecondaryColorGlobal)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              BorderSide(color: textSecondaryColorGlobal)),
                      labelStyle: secondaryTextStyle(),
                      hintText:
                          "Add skills and requirements you're looking for."),
                ),
              ],
            ),
          ),
          Divider(thickness: 1, height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Screening Questions", style: primaryTextStyle()),
                    Text("Complete all the fields above to add question.",
                        style: secondaryTextStyle()),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(AntDesign.pluscircle,
                        color: textSecondaryColorGlobal.withOpacity(0.3)))
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(thickness: 1, height: 0),
          Container(
            margin: EdgeInsets.all(16),
            child: StyledText(
              text: "By continuing, you agree with LinkPeople's" +
                  "<b>Jobs Terms and Conditions</b>" +
                  "including our" +
                  "<b>policies prohibiting discriminatory job posts.</b>",
              style: secondaryTextStyle(),
              tags: {
                'b': StyledTextTag(
                    style: boldTextStyle(color: primaryColor, size: 14))
              },
            ),
          ),
        ],
      ),
    );
  }

  component(title, subtitle, icon, onTap, color) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title + "*", style: primaryTextStyle()),
                  Text(subtitle,
                      style: secondaryTextStyle(color: color, size: 12)),
                ],
              ),
              IconButton(
                  onPressed: () {
                    onTap();
                  },
                  icon: Icon(icon, color: color))
            ],
          ),
        ),
        Divider(thickness: 1, height: 0)
      ],
    );
  }
}
