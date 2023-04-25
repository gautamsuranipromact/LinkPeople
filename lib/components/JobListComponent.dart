import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../screens/JobDetailScreen.dart';
import '../utils/AppDataProvider.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

Widget jobList(Function onTap) {
  return ListView.separated(
    itemCount: jobsList.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    separatorBuilder: (BuildContext context, int index) {
      return Divider(thickness: 1, indent: 50, height: 30);
    },
    itemBuilder: (BuildContext context, int index) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: context.cardColor,
                image: DecorationImage(
                    image: AssetImage(jobsList[index].companyImage!))),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(jobsList[index].jobType!, style: boldTextStyle()),
              SizedBox(height: 2),
              Text(jobsList[index].companyName!, style: primaryTextStyle()),
              SizedBox(height: 2),
              Text("India(Remote)", style: secondaryTextStyle()),
              SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                      minRadius: 10, backgroundImage: AssetImage(ic_profile)),
                  SizedBox(width: 4),
                  Text("Your profile matches this job",
                      style: secondaryTextStyle()),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('33 minutes ago',
                      style: boldTextStyle(size: 12, color: greenColor)),
                  Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Entypo.dot_single,
                        size: 8, color: textSecondaryColorGlobal),
                  ),
                  Image.asset(ic_appLogo, height: 15, width: 15),
                  SizedBox(width: 5),
                  Text("Easy Apply", style: secondaryTextStyle(size: 12)),
                ],
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
              onTap: () {
                jobsList[index].isBookMark = !jobsList[index].isBookMark!;
                onTap();
              },
              child: Icon(
                  jobsList[index].isBookMark == true
                      ? FontAwesome.bookmark
                      : FontAwesome.bookmark_o,
                  color: textSecondaryColorGlobal,
                  size: 24))
        ],
      ).onTap(() {
        JobDetailScreen(
                name: jobsList[index].jobType!,
                cName: jobsList[index].companyName!,
                img: jobsList[index].companyImage!)
            .launch(context,
                pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
      });
    },
  );
}
