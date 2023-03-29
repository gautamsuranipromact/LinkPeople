import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppDataProvider.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

Widget educationComponent({bool isEdit = false}) {
  return ListView.builder(
    itemCount: educationList.length,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: context.dividerColor, image: DecorationImage(fit: BoxFit.fill, image: AssetImage(educationList[index].img.toString()))),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(educationList[index].inName.toString(), style: primaryTextStyle()),
                  Text(educationList[index].degree.toString() + "," + educationList[index].field.toString(), style: primaryTextStyle()),
                  Text(educationList[index].startYear.toString() + "-" + educationList[index].endYear.toString(), style: secondaryTextStyle())
                ],
              ),
            ),
            Visibility(visible: isEdit, child: IconButton(onPressed: () {}, icon: Icon(Icons.edit, color: textSecondaryColorGlobal))),
          ],
        ),
      );
    },
  );
}
