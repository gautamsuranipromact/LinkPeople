import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

class AddDocumentScreen extends StatefulWidget {
  @override
  _AddDocumentScreenState createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
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
      appBar: appBarCommon(context, "Add a document", () {
        finish(context);
      }, action: [
        TextButton(
            onPressed: () {}, child: Text('Next', style: secondaryTextStyle()))
      ]),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            AppTextField(
              autoFocus: false,
              textFieldType: TextFieldType.EMAIL,
              keyboardType: TextInputType.emailAddress,
              errorThisFieldRequired: errorThisFieldRequired,
              maxLength: 58,
              decoration: inputDecoration(context,
                  label: "Add a description title to your document*"),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Text(
                    'Adding a title a helps your document get discovered more easily.',
                    style: secondaryTextStyle(size: 12)),
                Text('Learn more.',
                    style: secondaryTextStyle(color: primaryColor, size: 12)),
              ],
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                getFromGallery();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: radius(20),
                    color: context.scaffoldBackgroundColor,
                    border: Border.all(width: 1, color: primaryColor)),
                child: Text('Choose a file',
                    style: boldTextStyle(color: primaryColor)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getFromGallery() async {
    await FilePicker.platform.pickFiles(allowMultiple: true);
  }
}
