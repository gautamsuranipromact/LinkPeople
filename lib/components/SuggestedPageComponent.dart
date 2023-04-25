import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../models/PagesModel.dart';
import '../utils/AppColors.dart';
import '../utils/Extensions/Constants.dart';

class SuggestedPageComponent extends StatefulWidget {
  final PagesModel pageList;

  SuggestedPageComponent(this.pageList);

  @override
  _SuggestedPageComponentState createState() => _SuggestedPageComponentState();
}

class _SuggestedPageComponentState extends State<SuggestedPageComponent> {
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
    return Container(
      width: 240.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(color: context.dividerColor, width: 1.5)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            child: Container(
              decoration: BoxDecoration(color: context.scaffoldBackgroundColor),
              height: 120,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                        child: Image.asset(
                          widget.pageList.coverPhoto.toString(),
                          height: 60.0,
                          width: context.width(),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned.fill(
                      top: 30,
                      child: Image.asset(widget.pageList.image.toString()))
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 6),
              Text(widget.pageList.name.toString(), style: primaryTextStyle()),
              SizedBox(height: 6),
              Text("${widget.pageList.followers.toString()}  followers",
                  style: secondaryTextStyle(), textAlign: TextAlign.center),
            ],
          ),
          GestureDetector(
            onTap: () {
              widget.pageList.isFollow = true;
              setState(() {});
            },
            child: Container(
              width: context.width(),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                  color: context.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      width: 0.8,
                      color: widget.pageList.isFollow == true
                          ? textSecondaryColorGlobal
                          : primaryColor)),
              child: widget.pageList.isFollow == false
                  ? Text("Follow", style: primaryTextStyle(color: primaryColor))
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check,
                            size: 20, color: textSecondaryColorGlobal),
                        Text('following',
                            style: primaryTextStyle(
                                color: textSecondaryColorGlobal)),
                      ],
                    ),
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
