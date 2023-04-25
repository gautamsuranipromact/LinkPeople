import 'dart:async';

import 'package:flutter/material.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../models/AnwserModel.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/text_styles.dart';

class CategoryQueScreen extends StatefulWidget {
  @override
  _CategoryQueScreenState createState() => _CategoryQueScreenState();
}

class _CategoryQueScreenState extends State<CategoryQueScreen> {
  int isSelected = 0;

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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 110.0,
              floating: true,
              pinned: true,
              elevation: 2,
              backgroundColor: context.scaffoldBackgroundColor,
              iconTheme: IconThemeData(color: context.iconColor),
              automaticallyImplyLeading: true,
              leading: Icon(Icons.close, color: textSecondaryColorGlobal),
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Select a category", style: primaryTextStyle()),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(thickness: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text('Interview categories', style: primaryTextStyle()),
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                primary: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categoryList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(thickness: 1, height: 35);
                },
                itemBuilder: (context, i) {
                  AnswerModel data = categoryList[i];
                  return GestureDetector(
                    onTap: () {
                      isSelected = i;
                      setState(() {});
                      Timer(Duration(seconds: 1), () {
                        finish(context);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.text.toString(),
                                style: primaryTextStyle(
                                    color: isSelected == i
                                        ? greenColor
                                        : textPrimaryColorGlobal)),
                            Text(data.subtext.toString(),
                                style: primaryTextStyle(
                                    size: 12,
                                    color: isSelected == i
                                        ? greenColor
                                        : textPrimaryColorGlobal)),
                          ],
                        ),
                        Visibility(
                            visible: isSelected == i,
                            child: Icon(Icons.check, color: greenColor))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
