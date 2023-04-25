import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:styled_text/styled_text.dart';

import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/AppWidget.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

class EditExperienceComponent extends StatefulWidget {
  @override
  _EditExperienceComponentState createState() =>
      _EditExperienceComponentState();
}

class _EditExperienceComponentState extends State<EditExperienceComponent> {
  bool isAlert = false;
  bool isShow = false;
  DateTime today = DateTime.now();

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
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text('Add education', style: boldTextStyle()),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: context.dividerColor.withOpacity(0.3),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notify network', style: boldTextStyle()),
                    Text(
                        'Turn on to notify your network about job and education changes. Updates can take up to 2 hours.',
                        style: secondaryTextStyle()),
                  ],
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  activeColor: greenColor,
                  value: isAlert,
                  onChanged: (v) {
                    isAlert = !isAlert;
                    setState(() {});
                  },
                ).withHeight(10),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Title*"),
              ),
              SizedBox(height: 8),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Employee type*"),
              ),
              SizedBox(height: 8),
              StyledText(
                text: "Learn more about" + ' <b>employee type.</b>',
                style: secondaryTextStyle(),
                tags: {
                  'b': StyledTextTag(
                      style: secondaryTextStyle(color: primaryColor))
                },
              ),
              SizedBox(height: 16),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Company name"),
              ),
              SizedBox(height: 8),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.ADDRESS,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Location"),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomTheme(
                    child: Checkbox(
                      focusColor: primaryColor,
                      activeColor: primaryColor,
                      value: isShow,
                      onChanged: (bool? value) async {
                        isShow = !isShow;
                        setState(() {});
                      },
                    ),
                  ),
                  Text("I am currently working in this role",
                      style: secondaryTextStyle()),
                ],
              ),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.OTHER,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                onTap: () {
                  hideKeyboard(context);
                  showYearPicker(context);
                },
                showCursor: false,
                enabled: true,
                decoration: inputDecoration(context, label: "Start date"),
              ),
              SizedBox(height: 8),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.OTHER,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                onTap: () {
                  hideKeyboard(context);
                  showYearPicker(context);
                },
                showCursor: false,
                enabled: true,
                decoration: inputDecoration(context, label: "End date"),
              ),
              SizedBox(height: 8),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Industry"),
              ),
              SizedBox(height: 12),
              Text(
                  'LinkPeople uses industry information to provide more relevant recommendations',
                  style: secondaryTextStyle()),
              SizedBox(height: 16),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                maxLength: 2000,
                decoration: inputDecoration(context, label: "Description"),
              ),
              Text('Media', style: boldTextStyle()),
              SizedBox(height: 12),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Profile headline"),
              ),
              Text('Appear below your name at the top of the profile',
                  style: boldTextStyle()),
              Text(
                  'Add or link to external documents, photos, sites,videos and presentations.Learn more\n about media file type supported',
                  style: primaryTextStyle()),
              SizedBox(height: 16),
              Container(
                height: 34,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 0.8),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 20, color: primaryColor),
                    Text('Add media',
                        style: primaryTextStyle(color: primaryColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
