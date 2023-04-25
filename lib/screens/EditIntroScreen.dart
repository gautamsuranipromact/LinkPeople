import 'package:flutter/material.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppColors.dart';
import '../utils/AppWidget.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

class EditIntroScreen extends StatefulWidget {
  @override
  _EditIntroScreenState createState() => _EditIntroScreenState();
}

class _EditIntroScreenState extends State<EditIntroScreen> {
  bool isShow = false;

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
          "Edit intro",
          () {},
          leading: IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.close)),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          children: [
            AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              errorThisFieldRequired: errorThisFieldRequired,
              decoration: inputDecoration(context, label: "First name*"),
            ),
            SizedBox(height: 8),
            AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              errorThisFieldRequired: errorThisFieldRequired,
              decoration: inputDecoration(context, label: "Last name*"),
            ),
            SizedBox(height: 8),
            AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              errorThisFieldRequired: errorThisFieldRequired,
              decoration: inputDecoration(context, label: "Additional name"),
            ),
            SizedBox(height: 16),
            Text('name pronunciation', style: secondaryTextStyle()),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text('Add name pronunciation',
                      style: primaryTextStyle(color: primaryColor)),
                ],
              ),
            ),
            AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              errorThisFieldRequired: errorThisFieldRequired,
              decoration: inputDecoration(context, label: "HeadLine"),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text('Add name position',
                      style: primaryTextStyle(color: primaryColor)),
                ],
              ),
            ),
            SizedBox(height: 8),
            AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              errorThisFieldRequired: errorThisFieldRequired,
              decoration: inputDecoration(context, label: "Industry"),
            ),
            SizedBox(height: 16),
            Text('Education', style: boldTextStyle()),
            AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              errorThisFieldRequired: errorThisFieldRequired,
              decoration: inputDecoration(context, label: "Education"),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text('Add name education',
                      style: primaryTextStyle(color: primaryColor)),
                ],
              ),
            ),
            SizedBox(height: 8),
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
                Text("Show education in my intro",
                    style: secondaryTextStyle(size: 16)),
              ],
            ),
            SizedBox(height: 8),
            Text('Location', style: boldTextStyle()),
            AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              errorThisFieldRequired: errorThisFieldRequired,
              decoration: inputDecoration(context, label: "Country/Region"),
            ),
            SizedBox(height: 8),
            Text('Use current location',
                style: primaryTextStyle(color: primaryColor)),
            AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              errorThisFieldRequired: errorThisFieldRequired,
              decoration: inputDecoration(context, label: "City"),
            ),
            SizedBox(height: 8),
          ],
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          width: context.width(),
          height: 35,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration:
              BoxDecoration(color: primaryColor, borderRadius: radius(30)),
          child: Text("Save", style: boldTextStyle(color: Colors.white)),
        ));
  }
}
