import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import '../utils/AppCommon.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/text_styles.dart';

class ConnectionsScreen extends StatefulWidget {
  final bool? isPeople;

  ConnectionsScreen(this.isPeople);

  @override
  _ConnectionsScreenState createState() => _ConnectionsScreenState();
}

class _ConnectionsScreenState extends State<ConnectionsScreen> {
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
      appBar: appBarCommon(context, widget.isPeople == true ? "Peoples you follow" : "Connections", () {
        finish(context);
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 50,
                padding: EdgeInsets.only(left: 12),
                width: context.width(),
                child: Row(
                  children: [
                    Expanded(child: Text('16 connections', style: secondaryTextStyle())),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.filter_list_rounded))
                  ],
                )),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              primary: true,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: invitationUsers.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 1, indent: 75);
              },
              itemBuilder: (context, i) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(invitationUsers[i].imageUrl.toString()), maxRadius: 34, backgroundColor: context.cardColor),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(invitationUsers[i].name.toString(), style: boldTextStyle()),
                          SizedBox(height: 5),
                          Text(invitationUsers[i].profession.toString(), style: secondaryTextStyle(size: 14), maxLines: 2, overflow: TextOverflow.ellipsis),
                          Text(invitationUsers[i].mutualFriends.toString() + " Connect days ago", style: secondaryTextStyle(size: 12), maxLines: 1),
                        ],
                      ),
                    ),
                    SizedBox(width: 4),
                    IconButton(onPressed: () {}, icon: Icon(Entypo.dots_three_vertical, color: textSecondaryColorGlobal, size: 20)),
                    IconButton(onPressed: () {}, icon: Icon(MaterialCommunityIcons.telegram, color: textSecondaryColorGlobal))
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
