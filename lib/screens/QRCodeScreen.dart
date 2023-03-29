import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../utils/Extensions/text_styles.dart';

class QRCodeScreen extends StatefulWidget {
  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> with SingleTickerProviderStateMixin {
  TabController? controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(
        context,
        'Linked QR Scanner',
        () {
          finish(context);
        },
        bottom: PreferredSize(
          preferredSize: Size(context.width(), 50),
          child: TabBar(
            controller: controller,
            onTap: (i) {
              currentIndex = i;
              setState(() {});
            },
            indicatorColor: greenColor,
            labelColor: greenColor,
            unselectedLabelStyle: secondaryTextStyle(),
            unselectedLabelColor: textSecondaryColorGlobal,
            tabs: [
              Tab(child: Text('My Code')),
              Tab(child: Text('Scan')),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          MyCodeComponent(),
          ScanComponent(),
        ],
      ),
    );
  }
}

class MyCodeComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 260,
                width: context.width(),
                margin: EdgeInsets.only(top: 60, right: 16, left: 16),
                decoration: BoxDecoration(color: context.dividerColor, borderRadius: radius(8)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(ic_profile), maxRadius: 30),
                    SizedBox(height: 4),
                    Text('Muskan Agarwal', style: boldTextStyle()),
                    SizedBox(height: 4),
                    Text('Flutter developer', style: primaryTextStyle()),
                    SizedBox(height: 16),
                    Image.asset(ic_qrCode, width: 150, height: 150),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Ionicons.share_social_sharp, color: textSecondaryColorGlobal),
                SizedBox(width: 6),
                Text('Share my code', style: secondaryTextStyle()),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Feather.download, color: textSecondaryColorGlobal),
                SizedBox(width: 6),
                Text('Save to gallery', style: secondaryTextStyle()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ScanComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
