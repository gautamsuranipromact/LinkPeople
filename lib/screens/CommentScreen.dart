import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/components/TimeLineList.dart';
import 'package:link_people/main.dart';
import 'package:link_people/models/InvitationUsersModel.dart';
import 'package:link_people/models/LikeUser.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/date_time_extension.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../models/post_model.dart';
import '../utils/Extensions/AppTextField.dart';
import '../utils/Extensions/text_styles.dart';

class CommentScreen extends StatefulWidget {
  final PostModel post;

  CommentScreen(this.post);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<LikeUser> likeUser = [];
  List<InvitationUsers> invitationUsers = [];
  TextEditingController commentCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //getLikes();
    getComments();
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
                TimeLinePostBox(widget.post, isShare: false),
                SizedBox(height: 10),
                /* Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text('Reaction', style: boldTextStyle())),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      itemCount: likeUser.length,
                      itemBuilder: (c, i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Image.network(
                                  likeUser[i].imageUrl.toString(),
                                  fit: BoxFit.cover,
                                ).cornerRadiusWithClipRRect(25),
                              ),
                              Image.asset(ic_react1, width: 15, height: 15)
                            ],
                          ),
                        );
                      }),
                ),*/
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: Text('Comments', style: boldTextStyle())),
                          Text('Most relevant', style: secondaryTextStyle()),
                          Icon(MaterialIcons.expand_less,
                              color: textSecondaryColorGlobal),
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
                                  ClipRRect(
                                      borderRadius: radius(25),
                                      child: Image.network(
                                          invitationUsers[i]
                                              .imageUrl
                                              .toString(),
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover)),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: radius(8),
                                          color: context.dividerColor),
                                      padding: EdgeInsets.all(12),
                                      width: context.width(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      invitationUsers[i]
                                                          .name
                                                          .toString(),
                                                      style: boldTextStyle()),
                                                  Text(
                                                      invitationUsers[i]
                                                          .profession
                                                          .toString(),
                                                      style: primaryTextStyle(
                                                          size: 12)),
                                                  Text(
                                                      invitationUsers[i]
                                                          .time
                                                          .toString(),
                                                      style: secondaryTextStyle(
                                                          size: 12)),
                                                ],
                                              ),
                                              /*PopupMenuButton(
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    child: Row(
                                                      children: [
                                                        Icon(Entypo.share,
                                                            color:
                                                                textSecondaryColorGlobal),
                                                        SizedBox(width: 4),
                                                        Text("Share via..",
                                                            style:
                                                                secondaryTextStyle()),
                                                      ],
                                                    ),
                                                    value: 1,
                                                  ),
                                                  PopupMenuItem(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            MaterialCommunityIcons
                                                                .flag_variant,
                                                            color:
                                                                textSecondaryColorGlobal),
                                                        SizedBox(width: 4),
                                                        Text("Report comment",
                                                            style:
                                                                secondaryTextStyle()),
                                                      ],
                                                    ),
                                                    value: 2,
                                                  ),
                                                ],
                                              )*/
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          Text(invitationUsers[i].comment!,
                                              style: primaryTextStyle()),
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
                CircleAvatar(
                    backgroundImage: NetworkImage(
                        prefs.getString(SharePreferencesKey.PROFILE)!),
                    maxRadius: 15),
                Expanded(
                  child: AppTextField(
                    controller: commentCon,
                    keyboardType: TextInputType.multiline,
                    textFieldType: TextFieldType.OTHER,
                    textStyle: primaryTextStyle(),
                    cursorHeight: 20,
                    cursorColor: Colors.black,
                    decoration: outlineInputDecoration(context,
                        label: "Leave your thoughts here..."),
                  ),
                ),
                /*Text('@', style: boldTextStyle()),*/
                SizedBox(width: 30),
                GestureDetector(
                    onTap: () => addComment(),
                    child: Text('Post', style: secondaryTextStyle())),
              ],
            ),
          ),
        ],
      ),
    );
  }

  addComment() {
    hideKeyboard(context);
    String postId = widget.post.postId!;
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    CollectionReference postComments =
        FirebaseFirestore.instance.collection('postComments');
    DocumentReference reference = postComments.doc();
    reference.set({
      "commentId": reference.id,
      "userId": prefs.getString(SharePreferencesKey.USERID),
      "postId": widget.post.postId,
      "comment": commentCon.text,
      "searchText": prefs.getString(SharePreferencesKey.USERID)! +
          "" +
          widget.post.postId! +
          "",
      "timestamp": timestamp
    }).then((value) {
      widget.post.commentCount = widget.post.commentCount! + 1;

      CollectionReference post = FirebaseFirestore.instance.collection('posts');
      post.doc(postId).update({
        "comment": widget.post.commentCount,
      });
      setState(() {
        invitationUsers.insert(
            0,
            InvitationUsers(
                name: prefs.getString(SharePreferencesKey.FIRSTNAME)! +
                    " " +
                    prefs.getString(SharePreferencesKey.LASTNAME)!,
                imageUrl: prefs.getString(SharePreferencesKey.PROFILE)!,
                profession: "I am a " +
                    prefs.getString(SharePreferencesKey.USER_TYPE)! +
                    " and Looking for " +
                    prefs.getString(SharePreferencesKey.LOOKING_FOR)!,
                comment: commentCon.text,
                time: DateTime.now().timeAgo()));
      });
      commentCon.text = "";
    }).catchError((error) => print("Failed to add user: $error"));
  }

  void getComments() async {
    try {
      Query<Map<String, dynamic>> _postComments = FirebaseFirestore.instance
          .collection('postComments')
          .where("postId", isEqualTo: widget.post.postId);

      QuerySnapshot<Map<String, dynamic>> _postCommentsSnapshot =
          await _postComments.get();

      for (var doc in _postCommentsSnapshot.docs) {
        String userId = doc.get("userId");
        int timestamp = doc.get("timestamp");
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        DocumentSnapshot snapshot = await users.doc(userId).get();
        Map<String, dynamic> userMap = snapshot.data() as Map<String, dynamic>;
        String profile = userMap['profile'];
        String name = userMap['firstname'] + " " + userMap['lastname'];
        String userType = userMap['type'];
        String lookingFor = userMap['lookingFor'];
        String time =
            DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000).timeAgo();
        setState(() {
          invitationUsers.add(InvitationUsers(
              name: name,
              imageUrl: profile,
              profession:
                  "I am a " + userType + " and Looking for " + lookingFor,
              comment: doc.get("comment"),
              time: time));
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
