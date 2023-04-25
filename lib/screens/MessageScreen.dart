import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/screens/SendPostScreen.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../utils/AppColors.dart';
import '../utils/Extensions/text_styles.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool isFilter = false;
  List<String> filterList = [
    'All',
    'Unread',
    'My Connections',
    'InMail',
    'Archived',
    'Spam'
  ];

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
      backgroundColor: context.dividerColor,
      appBar: appBarCommon(
        context,
        "Messaging",
        () {
          finish(context);
        },
        action: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                    builder: (_) {
                      return Container(
                        padding: EdgeInsets.only(
                            right: 16, left: 16, top: 20, bottom: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: radiusCircular(16),
                                topRight: radiusCircular(16))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Container(
                                height: 5,
                                width: 50,
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: radius(), color: grey2),
                              ),
                            ),
                            Text('Manage chats', style: secondaryTextStyle()),
                            SizedBox(height: 20),
                            Text('Message request ibox',
                                style: secondaryTextStyle()),
                            SizedBox(height: 20),
                            Text('Set away message',
                                style: secondaryTextStyle()),
                          ],
                        ),
                      );
                    });
              },
              icon:
                  Icon(Feather.more_vertical, color: textSecondaryColorGlobal)),
          IconButton(
              onPressed: () {
                SendPostScreen().launch(context);
              },
              icon: Icon(Feather.edit, color: textSecondaryColorGlobal)),
        ],
      ),
      body: Container(
        color: context.scaffoldBackgroundColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Ionicons.search, color: textSecondaryColorGlobal),
                  Expanded(
                      child:
                          Text('Search messages', style: secondaryTextStyle())),
                  GestureDetector(
                      onTap: () {
                        isFilter = !isFilter;
                        setState(() {});
                      },
                      child: Icon(MaterialCommunityIcons.filter_variant,
                          color: textSecondaryColorGlobal))
                ],
              ),
            ),
            Divider(thickness: 1),
            Visibility(
              visible: isFilter,
              child: SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: filterList.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: radius(16),
                        border: Border.all(width: 0.3)),
                    child: Text(filterList[index], style: secondaryTextStyle()),
                  ),
                ),
              ),
            ),
            Visibility(visible: isFilter, child: Divider(thickness: 1)),
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: context.cardColor,
                      backgroundImage: AssetImage(ic_woman6),
                      maxRadius: 30),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Akansha bhadani', style: boldTextStyle()),
                        Text(
                            'Hi Akansha bhadani, we both studied engineering collage ',
                            style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  Text('Fri', style: secondaryTextStyle()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
