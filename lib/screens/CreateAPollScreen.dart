import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

class CreateAPollScreen extends StatefulWidget {
  @override
  _CreateAPollScreenState createState() => _CreateAPollScreenState();
}

class _CreateAPollScreenState extends State<CreateAPollScreen> {
  int selectedValue = 0;
  List<Widget> optionList = [];
  List<String> data = ['1 day', '3 day', '7 day', '2 week'];
  int ind = 2;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    optionList.add(component('option 1*', "Add option", 30));
    optionList.add(component('option 2*', "Add option", 30));
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
        "Create a Poll",
        () {
          finish(context);
        },
        action: [
          TextButton(
            onPressed: () {},
            child: Text('Done', style: secondaryTextStyle()),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            component('your question*', "Add question", 140),
            ListView.builder(
                shrinkWrap: true,
                itemCount: optionList.length,
                itemBuilder: (context, i) {
                  return optionList[i];
                }),
            Visibility(
              visible: ind < 4,
              child: GestureDetector(
                onTap: () {
                  ind++;
                  optionList.add(component('option $ind*', "Add option", 30));
                  setState(() {});
                },
                child: Container(
                  height: 30,
                  width: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: context.scaffoldBackgroundColor,
                      border: Border.all(width: 0.8, color: primaryColor),
                      borderRadius: radius(20)),
                  child: Text('+ Add Option',
                      style: primaryTextStyle(color: primaryColor)),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Pull duration', style: primaryTextStyle()),
            SizedBox(height: 6),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    context: context,
                    builder: (c) {
                      return Container(
                        height: 200,
                        decoration: BoxDecoration(borderRadius: radius(20)),
                        child: CupertinoPicker(
                          itemExtent: 40,
                          diameterRatio: 1,
                          squeeze: 1.5,
                          magnification: 1.5,
                          selectionOverlay: Container(
                            alignment: Alignment.center,
                            decoration:
                                BoxDecoration(border: Border.all(width: 0.5)),
                          ),
                          scrollController:
                              FixedExtentScrollController(initialItem: 2),
                          children: List.generate(
                            data.length,
                            (index) =>
                                Text(data[index], style: primaryTextStyle()),
                          ),
                          onSelectedItemChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                      );
                    });
              },
              child: Container(
                height: 40,
                width: context.width(),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.8, color: textSecondaryColorGlobal),
                    borderRadius: radius(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data[selectedValue], style: secondaryTextStyle()),
                    Icon(Ionicons.caret_down_sharp,
                        color: textSecondaryColorGlobal, size: 18)
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
                "We don't allow requests for political opinions, medical information or other sensitive data.",
                style: primaryTextStyle()),
          ],
        ),
      ),
    );
  }

  Widget component(text, hintText, maxLength) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: primaryTextStyle()),
        SizedBox(height: 6),
        TextField(
          cursorColor: textSecondaryColorGlobal,
          maxLength: maxLength,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              hintMaxLines: 2,
              contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: textSecondaryColorGlobal)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: textSecondaryColorGlobal)),
              labelStyle: secondaryTextStyle(),
              hintText: hintText),
        ),
      ],
    );
  }
}
