import 'package:flutter/material.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/AppTextField.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:styled_text/styled_text.dart';

import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  var mPaymentList = ["Online", "In person"];
  int _currentTimeValue = 0;

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
      backgroundColor: context.dividerColor,
      appBar: appBarCommon(
        context,
        "Create event",
        () {
          finish(context);
        },
        leading: IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.close)),
        action: [
          TextButton(
            onPressed: () {},
            child: Text('Done', style: secondaryTextStyle()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: context.scaffoldBackgroundColor,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(ic_bg,
                      width: context.width(), height: 220, fit: BoxFit.cover),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.scaffoldBackgroundColor),
                    child: Icon(Icons.edit,
                        color: textSecondaryColorGlobal, size: 16),
                  )
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Event type', style: primaryTextStyle()),
                    Container(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: mPaymentList.length,
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: index,
                                  groupValue: _currentTimeValue,
                                  onChanged: (dynamic ind) {
                                    setState(() {
                                      _currentTimeValue = ind;
                                    });
                                  }),
                              Text(mPaymentList[index],
                                  style: primaryTextStyle())
                            ],
                          );
                        },
                      ),
                    ),
                    AppTextField(
                      autoFocus: false,
                      textFieldType: TextFieldType.NAME,
                      keyboardType: TextInputType.name,
                      errorThisFieldRequired: errorThisFieldRequired,
                      decoration:
                          inputDecoration(context, label: "Event name*"),
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                        onTap: () {},
                        child: Text('Date and time*',
                            style: secondaryTextStyle())),
                    Divider(
                        thickness: 1,
                        height: 20,
                        color: textSecondaryColorGlobal.withOpacity(0.6)),
                    Visibility(
                        visible: _currentTimeValue == 1,
                        child: SizedBox(height: 15)),
                    Visibility(
                      visible: _currentTimeValue == 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: Text('Address*',
                                  style: secondaryTextStyle())),
                          Divider(
                              thickness: 1,
                              height: 20,
                              color: textSecondaryColorGlobal.withOpacity(0.6)),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _currentTimeValue == 1,
                      child: AppTextField(
                        autoFocus: false,
                        textFieldType: TextFieldType.EMAIL,
                        keyboardType: TextInputType.emailAddress,
                        errorThisFieldRequired: errorThisFieldRequired,
                        decoration: inputDecoration(context,
                            label: "Venue",
                            helperText: "Add floor,room number,etc"),
                      ),
                    ),
                    AppTextField(
                      autoFocus: false,
                      textFieldType: TextFieldType.EMAIL,
                      keyboardType: TextInputType.emailAddress,
                      errorThisFieldRequired: errorThisFieldRequired,
                      decoration: inputDecoration(context,
                          label: "Registration or broadcast link"),
                    ),
                    AppTextField(
                      autoFocus: false,
                      textFieldType: TextFieldType.EMAIL,
                      keyboardType: TextInputType.emailAddress,
                      errorThisFieldRequired: errorThisFieldRequired,
                      decoration: inputDecoration(context,
                          label: "Description",
                          helperText: "Ex: topics,schedule,etc."),
                    ),
                    SizedBox(height: 30),
                    StyledText(
                      text: "By continuing, you agree with " +
                          "<b>Find My CoFounder's policy</b>",
                      style: secondaryTextStyle(size: 12),
                      tags: {
                        'b': StyledTextTag(
                            style: boldTextStyle(color: primaryColor, size: 14))
                      },
                    ),
                    SizedBox(height: 20),
                    StyledText(
                      text: "Make the most of Find My CoFounder Events." +
                          "<b>Learn More</b>",
                      style: secondaryTextStyle(size: 12),
                      tags: {
                        'b': StyledTextTag(
                            style: boldTextStyle(color: primaryColor, size: 14))
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
