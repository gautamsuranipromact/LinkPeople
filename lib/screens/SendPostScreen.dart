import 'package:flutter/material.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppDataProvider.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/text_styles.dart';

class SendPostScreen extends StatefulWidget {
  @override
  _SendPostScreenState createState() => _SendPostScreenState();
}

class _SendPostScreenState extends State<SendPostScreen> {
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
      appBar: appBarCommon(context, "New message", () {},
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.close, color: textSecondaryColorGlobal),
            onPressed: () {
              finish(context);
            },
          )),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            height: 50,
            width: context.width(),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: context.scaffoldBackgroundColor, boxShadow: [BoxShadow(blurRadius: 0.1)]),
            child: Row(
              children: [
                Expanded(
                  child: AppTextField(
                    keyboardType: TextInputType.multiline,
                    textFieldType: TextFieldType.OTHER,
                    textStyle: primaryTextStyle(),
                    cursorHeight: 20,
                    cursorColor: Colors.black,
                    decoration: outlineInputDecoration(context, label: "Type name or multiple names", prefixIcon: Text("To:", style: primaryTextStyle())),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text('Suggested', style: boldTextStyle()).paddingOnly(left: 12,bottom: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            primary: true,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            itemCount: invitationUsers.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(thickness: 1, indent: 60,height: 25);
            },
            itemBuilder: (context, i) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(backgroundImage: AssetImage(invitationUsers[i].imageUrl.toString()), maxRadius: 25, backgroundColor: context.cardColor),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(invitationUsers[i].name.toString(), style: boldTextStyle()),
                        SizedBox(height: 5),
                        Text(invitationUsers[i].profession.toString(), style: secondaryTextStyle(size: 14), maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
