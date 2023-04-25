import 'package:flutter/material.dart';

import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';
import '../utils/Extensions/text_styles.dart';

class PagesScreen extends StatefulWidget {
  @override
  _PagesScreenState createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
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
      appBar: appBarCommon(context, "Company", () {
        finish(context);
      }),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) {
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Column(
                    children: [
                      Text('#workingathome', style: boldTextStyle()),
                      Text('802,325 followers', style: secondaryTextStyle()),
                    ],
                  ),
                ),
                Text('Following',
                    style: primaryTextStyle(color: textSecondaryColorGlobal)),
              ],
            );
          }),
    );
  }
}
