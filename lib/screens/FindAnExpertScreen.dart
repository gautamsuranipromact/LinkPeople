import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/AppTextField.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

class FindAnExpertScreen extends StatefulWidget {
  @override
  _FindAnExpertScreenState createState() => _FindAnExpertScreenState();
}

class _FindAnExpertScreenState extends State<FindAnExpertScreen> {
  String categories = '';
  int? currentIndex = 0;
  PageController pageController = PageController();

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
        "Find and expert",
        () {
          finish(context);
        },
        action: [
          TextButton(
            onPressed: () {},
            child: Text('Next', style: secondaryTextStyle()),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("A few Questions to describe what you're looking for:",
                style: primaryTextStyle()),
            SizedBox(height: 8),
            Text('What do you need help with?*', style: secondaryTextStyle()),
            DropdownButton<String>(
              isExpanded: true,
              underline:
                  Divider(thickness: 0.5, height: 2, color: context.iconColor),
              icon: Icon(Ionicons.md_chevron_down, size: 24),
              style: primaryTextStyle(),
              items: <String>[
                'Accounting',
                'Coaching and Mentoring',
                'Design',
                'Marketing',
                'Other',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: primaryTextStyle()));
              }).toList(),
              hint: Text(categories.isNotEmpty ? categories : "Select Category",
                  style: primaryTextStyle()),
              onChanged: (String? value) {
                setState(() {
                  categories = value!;
                });
                log(categories);
              },
            ),
            SizedBox(height: 12),
            Text('Location*', style: secondaryTextStyle()),
            SizedBox(height: 12),
            Text('Childersburg,United States', style: primaryTextStyle()),
            Divider(thickness: 0.5, color: context.iconColor),
            SizedBox(height: 20),
            Text("Description*", style: secondaryTextStyle()),
            SizedBox(height: 6),
            AppTextField(
              textFieldType: TextFieldType.ADDRESS,
              cursorColor: textSecondaryColorGlobal,
              maxLength: 750,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  hintMaxLines: 2,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: textSecondaryColorGlobal)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: textSecondaryColorGlobal)),
                  labelStyle: secondaryTextStyle(),
                  helperText: "25 character minimum",
                  hintText:
                      "I am looking for recommendations for professionals who can help me with a few projects"),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 120,
              child: PageView.builder(
                itemCount: expertList.length,
                controller: pageController,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    height: 80,
                    padding: EdgeInsets.all(8),
                    width: context.width(),
                    decoration: BoxDecoration(
                        color: context.dividerColor,
                        borderRadius: radius(6),
                        boxShadow: [
                          BoxShadow(
                              color: grey2, blurRadius: 1, offset: Offset(0, 0))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Example of what to write',
                            style: primaryTextStyle()),
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                                backgroundImage:
                                    AssetImage(expertList[i].img.toString())),
                            SizedBox(width: 12),
                            Expanded(
                                child: Text(expertList[i].text.toString(),
                                    style: secondaryTextStyle())),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                onPageChanged: (int i) {
                  currentIndex = i;
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 12),
            dotIndicator(expertList, currentIndex),
          ],
        ),
      ),
    );
  }
}
