import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/main.dart';
import 'package:link_people/models/post_model.dart';
import 'package:link_people/screens/ProfileScreen.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import 'package:newsfeed_multiple_imageview/newsfeed_multiple_imageview.dart';

import '../screens/CommentScreen.dart';
import '../utils/AppColors.dart';
import '../utils/AppImages.dart';

class TimeLinePostBox extends StatefulWidget {
  final bool? isShare;
  final PostModel? post;

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
      decoration: widget.isShare == false
          ? BoxDecoration(
              border: Border.all(width: 0.5, color: textSecondaryColorGlobal),
              borderRadius: radius(8))
          : BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Visibility(
                  visible: false,
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
                                  Text(widget.post!.likeCount.toString(),
                                      style: secondaryTextStyle()),
                                  SizedBox(width: 8),
                                  Text("celebrates this",
                                      style: primaryTextStyle(
                                          color: reactionColor)),
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
                    ProfileScreen(false, widget.post!.userId).launch(context);
                  },
                  child: Row(
                    children: [
                      widget.post!.userImage!.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage:
                                  NetworkImage(widget.post!.userImage!),
                              maxRadius: 30,
                              minRadius: 20,
                              backgroundColor: context.cardColor)
                          : CircleAvatar(
                              minRadius: 25,
                              backgroundColor: context.cardColor,
                              backgroundImage: AssetImage(ic_placeHolder)),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(widget.post!.userName.toString(),
                                style: boldTextStyle()),
                            Text(widget.post!.subContent.toString(),
                                style: primaryTextStyle(
                                    color: reactionColor, size: 14),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            Row(
                              children: [
                                Text(
                                    widget.post!.dateRecorded == null
                                        ? ""
                                        : widget.post!.dateRecorded!,
                                    style: secondaryTextStyle()),
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    child: Text("*")),
                                Icon(Icons.public,
                                    color: reactionColor, size: 12),
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
          SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
            child: Text(parseHtmlString(widget.post!.content!)),
          ),
          widget.post!.imageMediaList!.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: NewsfeedMultipleImageView(
                    imageUrls: widget.post!.imageMediaList!,
                  ))
              : SizedBox(
                  height: 1,
                ),
          Visibility(
            visible: widget.isShare!,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      CommentScreen(widget.post!).launch(context,
                          pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                    backgroundColor: context.cardColor,
                                    maxRadius: 10,
                                    backgroundImage: AssetImage(ic_react1)),
                                /*Positioned(
                                    left: 17,
                                    child: CircleAvatar(
                                        backgroundColor: context.cardColor,
                                        maxRadius: 10,
                                        backgroundImage: AssetImage(ic_react2))),
                                Positioned(
                                    left: 34,
                                    child: CircleAvatar(
                                        backgroundColor: context.cardColor,
                                        maxRadius: 10,
                                        backgroundImage: AssetImage(ic_react3)))*/
                              ],
                            ),
                          ),
                          Expanded(
                              child: Text(widget.post!.likeCount.toString(),
                                  style: secondaryTextStyle())),
                          Text(
                              widget.post!.commentCount.toString() +
                                  " comments",
                              style: secondaryTextStyle())
                        ],
                      ),
                    ),
                  ),
                  Divider(thickness: 1, height: 0),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      button(
                          widget.post!.isLiked == true
                              ? FontAwesome.thumbs_up
                              : FontAwesome.thumbs_o_up,
                          "Like",
                          () => clickOnLike()),
                      button(Ionicons.chatbox_ellipses, "Comment", () {
                        /*CommentScreen(widget.post!).launch(context,
                            pageRouteAnimation: PageRouteAnimation.Slide);*/
                        Navigator.of(context)
                            .push(
                              new MaterialPageRoute(
                                  builder: (_) =>
                                      new CommentScreen(widget.post!)),
                            )
                            .then((val) => {setState(() {})});
                      }),
                      /*button(FontAwesome.share_alt, "Share", () {
                        PostScreen(isSharePost: true, post: widget.post!)
                            .launch(context);
                      }),
                      button(FontAwesome.send, "Send", () {
                        SendPostScreen().launch(context,
                            pageRouteAnimation:
                                PageRouteAnimation.SlideBottomTop);
                      }),*/
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
          Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(text, style: secondaryTextStyle())),
        ],
      ),
    );
  }

  clickOnLike() {
    bool like = !widget.post!.isLiked!;
    String likeId = widget.post!.likeId!;
    if (likeId.isNotEmpty) {
      CollectionReference profile =
          FirebaseFirestore.instance.collection('postLikes');
      profile
          .doc(likeId)
          .update({
            "userId": prefs.getString(SharePreferencesKey.USERID),
            "postId": widget.post!.postId,
            "like": like,
            "searchText": prefs.getString(SharePreferencesKey.USERID)! +
                "" +
                widget.post!.postId! +
                "" +
                like.toString()
          })
          .then((value) => _next(like))
          .catchError((error) => _error());

      /*DatabaseReference ref =
          FirebaseDatabase.instance.ref("postLikes/$likeId");
      ref.update({
        "userId": prefs.getString(SharePreferencesKey.USERID),
        "postId": widget.post!.postId,
        "like": like,
        "searchText": prefs.getString(SharePreferencesKey.USERID)! +
            "" +
            widget.post!.postId! +
            "" +
            like.toString()
      }).whenComplete(() {
        widget.post!.isLiked = like;
        String postId = widget.post!.postId!;
        if (like) {
          widget.post!.likeCount = widget.post!.likeCount! + 1;
        } else {
          widget.post!.likeCount = widget.post!.likeCount! - 1;
        }
        DatabaseReference postRef =
            FirebaseDatabase.instance.ref("posts/$postId");
        postRef.update({
          "like": widget.post!.likeCount,
        });
        setState(() {});
      });*/
    } else {
      CollectionReference post =
          FirebaseFirestore.instance.collection('postLikes');
      DocumentReference reference = post.doc();
      reference
          .set({
            "likeId": reference.id,
            "userId": prefs.getString(SharePreferencesKey.USERID),
            "postId": widget.post!.postId,
            "like": like,
            "searchText": prefs.getString(SharePreferencesKey.USERID)! +
                "" +
                widget.post!.postId! +
                "" +
                like.toString()
          })
          .then((value) => _next(like))
          .catchError((error) => print("Failed to add user: $error"));

      /*DatabaseReference ref = FirebaseDatabase.instance.ref("postLikes").push();
      ref.set({
        "userId": prefs.getString(SharePreferencesKey.USERID),
        "postId": widget.post!.postId,
        "like": like,
        "searchText": prefs.getString(SharePreferencesKey.USERID)! +
            "" +
            widget.post!.postId! +
            "" +
            like.toString()
      }).whenComplete(() {
        widget.post!.isLiked = like;
        String postId = widget.post!.postId!;
        if (like) {
          widget.post!.likeCount = widget.post!.likeCount! + 1;
        } else {
          widget.post!.likeCount = widget.post!.likeCount! - 1;
        }
        DatabaseReference postRef =
            FirebaseDatabase.instance.ref("posts/$postId");
        postRef.update({
          "like": widget.post!.likeCount,
        });
        setState(() {});
      });*/
    }
  }

  _next(bool like) {
    widget.post!.isLiked = like;
    String postId = widget.post!.postId!;
    if (like) {
      widget.post!.likeCount = widget.post!.likeCount! + 1;
    } else {
      widget.post!.likeCount = widget.post!.likeCount! - 1;
    }
    CollectionReference profile =
        FirebaseFirestore.instance.collection('posts');
    profile.doc(postId).update({
      "like": widget.post!.likeCount,
    });
    setState(() {});
  }

  _error() {}
}
