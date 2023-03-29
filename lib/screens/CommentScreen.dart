import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/components/TimeLineList.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import '../models/TimeLinePostModel.dart';
import '../utils/AppDataProvider.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/text_styles.dart';

class CommentScreen extends StatefulWidget {
  final TimelinePost post;

  CommentScreen(this.post);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
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
      appBar: appBarCommon(context, "", () {
        finish(context);
      }),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimeLinePostBox(widget.post, isShare: true),
                SizedBox(height: 10),
                Padding(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), child: Text('Reaction', style: boldTextStyle())),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      itemCount: invitationUsers.length,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                child: Image.asset(
                                  invitationUsers[i].imageUrl.toString(),
                                  fit: BoxFit.cover,
                                ).cornerRadiusWithClipRRect(25),
                              ),
                              Image.asset(ic_react1, width: 15, height: 15)
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: Text('Comments', style: boldTextStyle())),
                          Text('Most relevant', style: secondaryTextStyle()),
                          Icon(MaterialIcons.expand_less, color: textSecondaryColorGlobal),
                        ],
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.all(0),
                          itemCount: invitationUsers.length,
                          itemBuilder: (c, i) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  ClipRRect(borderRadius: radius(25), child: Image.asset(invitationUsers[i].imageUrl.toString(), height: 50, width: 50, fit: BoxFit.cover)),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: radius(8), color: context.dividerColor),
                                      padding: EdgeInsets.all(12),
                                      width: context.width(),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(invitationUsers[i].name.toString(), style: boldTextStyle()),
                                                  Text(invitationUsers[i].profession.toString(), style: primaryTextStyle(size: 12)),
                                                  Text(invitationUsers[i].time.toString(), style: secondaryTextStyle(size: 12)),
                                                ],
                                              ),
                                              PopupMenuButton(
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    child: Row(
                                                      children: [
                                                        Icon(Entypo.share, color: textSecondaryColorGlobal),
                                                        SizedBox(width: 4),
                                                        Text("Share via..", style: secondaryTextStyle()),
                                                      ],
                                                    ),
                                                    value: 1,
                                                  ),
                                                  PopupMenuItem(
                                                    child: Row(
                                                      children: [
                                                        Icon(MaterialCommunityIcons.flag_variant, color: textSecondaryColorGlobal),
                                                        SizedBox(width: 4),
                                                        Text("Report comment", style: secondaryTextStyle()),
                                                      ],
                                                    ),
                                                    value: 2,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          Text('Is this part time?', style: primaryTextStyle()),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: context.width(),
            padding: EdgeInsets.all(12),
            color: context.cardColor,
            child: Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(ic_profile), maxRadius: 15),
                Expanded(
                  child: AppTextField(
                    keyboardType: TextInputType.multiline,
                    textFieldType: TextFieldType.OTHER,
                    textStyle: primaryTextStyle(),
                    cursorHeight: 20,
                    cursorColor: Colors.black,
                    decoration: outlineInputDecoration(context, label: "Leave your thoughts here..."),
                  ),
                ),
                Text('@', style: boldTextStyle()),
                SizedBox(width: 30),
                Text('Post', style: secondaryTextStyle()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
