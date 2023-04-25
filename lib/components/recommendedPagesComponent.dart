import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';

import '../screens/RecommendationScreen.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/text_styles.dart';
import 'SuggestedPageComponent.dart';

class RecommendedPagesComponent extends StatefulWidget {
  @override
  _RecommendedPagesComponentState createState() =>
      _RecommendedPagesComponentState();
}

class _RecommendedPagesComponentState extends State<RecommendedPagesComponent> {
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
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pages you may like", style: primaryTextStyle()),
          SizedBox(height: 16),
          AlignedGridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 10,
            itemBuilder: (context, index) {
              return SuggestedPageComponent(pagesList[index]);
            },
          ),
          SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                RecommendationScreen(isPage: true).launch(context);
              },
              child: Text("See all", style: boldTextStyle(color: primaryColor)),
            ),
          ),
        ],
      ),
    );
  }
}
