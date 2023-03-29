import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:link_people/components/TimeLineList.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/AppTextField.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../models/TimeLinePostModel.dart';
import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';
import '../screens/AddDocumentScreen.dart';
import '../screens/CreateAJobScreen.dart';
import '../screens/CreateAPollScreen.dart';
import '../screens/CreateEventScreen.dart';
import '../screens/FindAnExpertScreen.dart';
import '../screens/SelectAnOptionScreen.dart';

class PostScreen extends StatefulWidget {
  final bool isSharePost;
  final TimelinePost? post;

  PostScreen({this.isSharePost = false, this.post});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController controller = TextEditingController();
  int _currentTimeValue = 0;
  String? data;

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        finish(context, true);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: appBarCommon(
          context,
          'Share Post',
          () {},
          leading: IconButton(
              onPressed: () {
                finish(context, true);
              },
              icon: Icon(Icons.clear, color: reactionColor)),
          action: [
            Padding(
              padding: EdgeInsets.only(top: 20, right: 12),
              child: Text('Post', style: secondaryTextStyle()),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(minRadius: 25, backgroundColor: context.cardColor, backgroundImage: AssetImage(ic_profile)),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Muskan Agrawal", style: boldTextStyle()),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          anyoneOnTap();
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(width: 2, color: grey2)),
                          child: Row(
                            children: [
                              SizedBox(width: 4),
                              Icon(Icons.public, size: 18),
                              Text(data ?? "Anyone", style: primaryTextStyle()),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              AppTextField(
                keyboardType: TextInputType.multiline,
                textFieldType: TextFieldType.OTHER,
                controller: controller,
                textStyle: primaryTextStyle(),
                cursorHeight: 20,
                cursorColor: Colors.black,
                decoration: outlineInputDecoration(context, label: widget.isSharePost ? "write something or add a hashthag" : "What do you want to talk about"),
              ),
              widget.isSharePost ? TimeLinePostBox(widget.post, isShare: false) : SizedBox(),
              Spacer(),
              Container(
                height: 70,
                width: context.width(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: GestureDetector(
                          onTap: () {
                            controller.text = "#";
                            setState(() {});
                          },
                          child: Text("Add hashtag", style: primaryTextStyle(color: primaryColor, size: 14))),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                getFromCamera();
                              },
                              icon: Icon(FontAwesome.camera, color: reactionColor, size: 22)),
                          IconButton(
                              onPressed: () {
                                getFromVideo();
                              },
                              icon: Icon(FontAwesome.video_camera, color: reactionColor, size: 22)),
                          IconButton(
                              onPressed: () {
                                getFromGallery();
                              },
                              icon: Icon(Ionicons.image, color: reactionColor, size: 24)),
                          IconButton(
                              onPressed: () {
                                showSheet();
                              },
                              icon: Icon(Icons.more_horiz, color: reactionColor, size: 30)),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              anyoneOnTap();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Icon(Ionicons.chatbox_ellipses, size: 16, color: textSecondaryColorGlobal),
                                  SizedBox(width: 4),
                                  Text(data ?? "Anyone", style: primaryTextStyle(size: 12, color: textSecondaryColorGlobal)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bottomSheetComponent(IconData icon, text, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: textSecondaryColorGlobal, size: 22),
            SizedBox(width: 12),
            Text(text, style: primaryTextStyle(size: 14, color: textSecondaryColorGlobal)),
          ],
        ),
      ),
    );
  }

  anyoneBottomSheetComponent(IconData icon, text, subtext) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(icon, color: textSecondaryColorGlobal, size: 20),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: boldTextStyle()),
              Text(subtext, style: secondaryTextStyle()),
            ],
          )
        ],
      ),
    );
  }

  anyoneOnTap() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(right: 16, left: 16, top: 20, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 50,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(borderRadius: radius(), color: grey2),
                  ),
                ),
                Text('Who can comment on your post?', style: boldTextStyle()),
                SizedBox(height: 16),
                ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _currentTimeValue = index;
                        data = list[_currentTimeValue].name.toString();
                        finish(context);
                      },
                      child: Row(
                        children: [
                          Icon(list[index].icon, color: textSecondaryColorGlobal, size: 20),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(list[index].name.toString(), style: boldTextStyle()),
                                Text(list[index].description.toString(), style: secondaryTextStyle()),
                              ],
                            ),
                          ),
                          Radio(
                              value: index,
                              activeColor: greenColor,
                              groupValue: _currentTimeValue,
                              onChanged: (dynamic ind) {
                                setState(() {
                                  _currentTimeValue = ind;
                                  data = list[_currentTimeValue].name.toString();
                                  finish(context);
                                });
                              }),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  void getFromGallery() async {
    await ImagePicker().pickImage(source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800);
  }

  getFromCamera() async {
    await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800);
  }

  getFromVideo() async {
    await ImagePicker().pickVideo(source: ImageSource.camera);
  }

  showSheet() {
    return showModalBottomSheet(
        context: context,
        barrierColor: Colors.transparent,
        elevation: 20,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        backgroundColor: context.scaffoldBackgroundColor,
        builder: (_) {
          return Container(
            padding: EdgeInsets.only(right: 16, left: 16, top: 20, bottom: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: radiusCircular(16), topRight: radiusCircular(16))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(height: 5, width: 50, margin: EdgeInsets.only(bottom: 20), decoration: BoxDecoration(borderRadius: radius(), color: grey2)),
                bottomSheetComponent(Ionicons.image, "Add Photo", () {
                  getFromGallery();
                }),
                bottomSheetComponent(Ionicons.md_videocam, "Take Video", () {
                  getFromVideo();
                }),
                bottomSheetComponent(FontAwesome.certificate, "Celebrate an occasion", () {
                  SelectAnOptionScreen().launch(context);
                }),
                bottomSheetComponent(Ionicons.document, "Add Document", () {
                  AddDocumentScreen().launch(context);
                }),
                bottomSheetComponent(Icons.work, "Share that you're hiring", () {
                  CreateAJobScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                }),
                bottomSheetComponent(Ionicons.ios_people_circle, "Find an expert", () {
                  FindAnExpertScreen().launch(context);
                }),
                bottomSheetComponent(MaterialCommunityIcons.poll, "Create a poll", () {
                  CreateAPollScreen().launch(context);
                }),
                bottomSheetComponent(Octicons.calendar, "Create event", () {
                  CreateEventScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                }),
              ],
            ),
          );
        });
  }
}
