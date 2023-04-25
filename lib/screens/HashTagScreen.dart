import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../models/WalkThroughModel.dart';
import '../utils/AppCommon.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/text_styles.dart';

class HashTagScreen extends StatefulWidget {
  final bool? isHashTag;

  HashTagScreen(this.isHashTag);

  @override
  _HashTagScreenState createState() => _HashTagScreenState();
}

class _HashTagScreenState extends State<HashTagScreen> {
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
          context, widget.isHashTag == true ? "HashTags" : "Pages", () {
        finish(context);
      }),
      body: ListView.separated(
        padding: EdgeInsets.all(12),
        itemCount:
            widget.isHashTag == true ? hashTagList.length : pageList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Visibility(
              visible: index != hashTagList.length - 1,
              child: Divider(thickness: 1, height: 20));
        },
        itemBuilder: (context, i) {
          WalkThroughModel data =
              widget.isHashTag == true ? hashTagList[i] : pageList[i];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                widget.isHashTag == true
                    ? Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.3),
                            shape: BoxShape.circle),
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: context.scaffoldBackgroundColor,
                              shape: BoxShape.circle),
                          child: Icon(Feather.hash),
                        ),
                      )
                    : Image.asset(data.img.toString(),
                        height: 40, width: 40, fit: BoxFit.cover),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('#${data.text}', style: boldTextStyle()),
                      SizedBox(height: 4),
                      Text('${data.name} followers',
                          style: secondaryTextStyle()),
                    ],
                  ),
                ),
                Text('Following',
                    style: primaryTextStyle(color: textSecondaryColorGlobal)),
              ],
            ),
          );
        },
      ),
    );
  }
}
