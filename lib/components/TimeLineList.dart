import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/fragments/PostScreen.dart';
import 'package:link_people/screens/ViewProfileScreen.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import '../models/TimeLinePostModel.dart';
import '../screens/CommentScreen.dart';
import '../screens/SendPostScreen.dart';
import '../screens/ZoomeImagScreen.dart';
import '../utils/AppColors.dart';
import '../utils/AppImages.dart';

class TimeLinePostBox extends StatefulWidget {
  final bool? isShare;
  final TimelinePost? post;

  TimeLinePostBox(this.post, {this.isShare = false});

  @override
  _TimeLinePostBoxState createState() => _TimeLinePostBoxState();
}

class _TimeLinePostBoxState extends State<TimeLinePostBox> {
  final iconSize = 18.0;

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
    return Container(
      decoration: widget.isShare == false ? BoxDecoration(border: Border.all(width: 0.5, color: textSecondaryColorGlobal), borderRadius: radius(8)) : BoxDecoration(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Visibility(
                  visible: widget.isShare!,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: context.width(),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(widget.post!.likedByUser.toString(), style: secondaryTextStyle()),
                                  SizedBox(width: 8),
                                  Text("celebrates this", style: primaryTextStyle(color: reactionColor)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1, height: 1),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    ViewProfileScreen(name: widget.post!.name.toString(), image: widget.post!.profilePhoto.toString()).launch(context);
                  },
                  child: Row(
                    children: [
                      CircleAvatar(backgroundColor: context.cardColor, maxRadius: 26, backgroundImage: AssetImage(widget.post!.profilePhoto.toString())),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(widget.post!.name.toString(), style: boldTextStyle()),
                            Text(widget.post!.profession.toString(), style: primaryTextStyle(color: reactionColor, size: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                            Row(
                              children: [
                                Text('1w', style: secondaryTextStyle()),
                                Icon(Icons.public, color: reactionColor, size: 12),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              ZoomImageScreen(widget.post!.image.toString()).launch(context);
            },
            child: Padding(padding: EdgeInsets.only(top: 8), child: Image(image: AssetImage(widget.post!.image.toString())))
                .cornerRadiusWithClipRRectOnly(bottomRight: widget.isShare == false ? 8 : 0, bottomLeft: widget.isShare == false ? 8 : 0),
          ),
          Visibility(
            visible: widget.isShare!,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      CommentScreen(widget.post!).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                    },
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
                        Text(widget.post!.comments.toString() + " comments", style: secondaryTextStyle())
                      ],
                    ),
                  ),
                  Divider(thickness: 1, height: 0),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button(widget.post!.isPostLike == true ? FontAwesome.thumbs_up : FontAwesome.thumbs_o_up, "Like", () {
                        widget.post!.isPostLike = !widget.post!.isPostLike!;
                        setState(() {});
                      }),
                      button(Ionicons.chatbox_ellipses, "Comment", () {
                        CommentScreen(widget.post!).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                      }),
                      button(FontAwesome.share_alt, "Share", () {
                        PostScreen(isSharePost: true, post: widget.post!).launch(context);
                      }),
                      button(FontAwesome.send, "Send", () {
                        SendPostScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  button(IconData icon, String text, onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Icon(icon, color: context.iconColor, size: iconSize),
          Padding(padding: EdgeInsets.only(top: 2), child: Text(text, style: secondaryTextStyle())),
        ],
      ),
    );
  }
}
