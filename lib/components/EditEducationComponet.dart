import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

class EditEducationComponent extends StatefulWidget {
  @override
  _EditEducationComponentState createState() => _EditEducationComponentState();
}

class _EditEducationComponentState extends State<EditEducationComponent> {
  bool isAlert = false;

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
                    Text('Turn on to notify your network about job and education changes. Updates can take up to 2 hours.', style: secondaryTextStyle()),
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
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "School*"),
              ),
              SizedBox(height: 8),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Degree*"),
              ),
              SizedBox(height: 8),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Field of study"),
              ),
              SizedBox(height: 16),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                onTap: () {
                  hideKeyboard(context);
                  showYearPicker(context);
                },
                showCursor: false,
                enabled: true,
                decoration: inputDecoration(context, label: "start a date"),
              ),
              SizedBox(height: 8),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                onTap: () {
                  hideKeyboard(context);
                  showYearPicker(context);
                },
                showCursor: false,
                enabled: true,
                decoration: inputDecoration(context, label: "End date(or expected)"),
              ),
              SizedBox(height: 16),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "grade"),
              ),
              SizedBox(height: 8),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Activities and societies"),
              ),
              SizedBox(height: 8),
              AppTextField(
                autoFocus: false,
                textFieldType: TextFieldType.EMAIL,
                keyboardType: TextInputType.emailAddress,
                errorThisFieldRequired: errorThisFieldRequired,
                decoration: inputDecoration(context, label: "Description"),
              ),
              SizedBox(height: 16),
              Text('Media', style: boldTextStyle()),
              SizedBox(height: 12),
              Text('Add or link to external documents, photos, sites,videos and presentations.Learn more\n about media file type supported', style: primaryTextStyle()),
              SizedBox(height: 16),
              Container(
                height: 34,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(border: Border.all(color: primaryColor, width: 0.8), borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 20, color: primaryColor),
                    Text('Add media', style: primaryTextStyle(color: primaryColor)),
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
