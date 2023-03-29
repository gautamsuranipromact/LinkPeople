import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../screens/RecommendationScreen.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/text_styles.dart';
import 'NetworkItem.dart';

class SuggestedPeopleComponent extends StatelessWidget {
  final String text;
  final int count;

  const SuggestedPeopleComponent({Key? key, required this.text, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Text(text, style: primaryTextStyle())),
          Container(
            color: context.scaffoldBackgroundColor,
            child: Column(
              children: [
                AlignedGridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: count,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    return NetworkItem(
                        image: invitationUsers[index].imageUrl.toString(),
                        name: invitationUsers[index].name.toString(),
                        profession: invitationUsers[index].profession.toString(),
                        mutual: invitationUsers[index].mutualFriends!.toInt());
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    onTap: () {
                      RecommendationScreen().launch(context);
                    },
                    child: Text("See all", style: boldTextStyle(color: primaryColor)),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
