import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../utils/AppImages.dart';

Widget reactionBox(BuildContext context) {
  return Container(
    width: context.width(),
    height: 38,
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35,
            width: 60,
            child: Stack(
              children: [
                CircleAvatar(backgroundColor: context.cardColor, maxRadius: 10, backgroundImage: AssetImage(ic_react1)),
                Positioned(left: 17, child: CircleAvatar(backgroundColor: context.cardColor, maxRadius: 10, backgroundImage: AssetImage(ic_react2))),
                Positioned(left: 34, child: CircleAvatar(backgroundColor: context.cardColor, maxRadius: 10, backgroundImage: AssetImage(ic_react3)))
              ],
            ),
          ),
          Expanded(child: Text("92,928", style: secondaryTextStyle())),
          TextButton(
              onPressed: (){

              },
              child: Text("90 comments", style: secondaryTextStyle()))
        ],
      ),
    ),
  );
}
