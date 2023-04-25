import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../components/ProfileComponent.dart';
import '../screens/EditIntroScreen.dart';
import '../utils/AppColors.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/decorations.dart';

class ProfileBox extends StatelessWidget {
  final String? img;
  final bool? isUser;

  ProfileBox(this.img, {this.isUser = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height() * 0.18,
      width: context.width(),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: context.height() * 0.11,
                    width: context.width(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill, image: AssetImage(ic_bg))),
                  ),
                  Visibility(
                    visible: isUser!,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25))),
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
                                            borderRadius: radius(),
                                            color: grey2),
                                      ),
                                    ),
                                    Text('Add profile photo',
                                        style: boldTextStyle()),
                                    SizedBox(height: 16),
                                    bottomSheetComponent(context,
                                        text: "Take a photo",
                                        onTap: () {},
                                        icon: Ionicons.camera,
                                        isSubtext: false),
                                    bottomSheetComponent(context,
                                        text: "upload from Photos",
                                        subtext:
                                            "On LinkPeople, we require members to use their real identities, so upload a photo of yourself",
                                        onTap: () {},
                                        icon: Ionicons.images_outline,
                                        isSubtext: false),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.scaffoldBackgroundColor,
                            boxShadow: [BoxShadow(blurRadius: 3)]),
                        child: Icon(MaterialCommunityIcons.camera, size: 18),
                      ),
                    ),
                  )
                ],
              ),
              Visibility(
                visible: isUser!,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      EditIntroScreen().launch(context);
                    },
                    child: Icon(MaterialIcons.mode_edit),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 5,
            left: 12,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.white),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(ic_profile)),
                  ),
                ),
                Visibility(
                  visible: isUser!,
                  child: Padding(
                      padding: EdgeInsets.only(right: 4, bottom: 4),
                      child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25))),
                                builder: (_) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                        right: 16,
                                        left: 16,
                                        top: 20,
                                        bottom: 16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: radiusCircular(16),
                                            topRight: radiusCircular(16))),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 50,
                                          margin: EdgeInsets.only(bottom: 20),
                                          decoration: BoxDecoration(
                                              borderRadius: radius(),
                                              color: grey2),
                                        ),
                                        bottomSheetComponent(context,
                                            text: "Add profile photo",
                                            onTap: () {},
                                            icon: Ionicons.camera,
                                            isSubtext: false),
                                        bottomSheetComponent(context,
                                            text: "Add profile video",
                                            onTap: () {},
                                            icon: Ionicons.ios_videocam,
                                            isSubtext: false),
                                        bottomSheetComponent(context,
                                            text: "Add frame",
                                            onTap: () {},
                                            icon: Ionicons.ios_image,
                                            isSubtext: false),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: context.scaffoldBackgroundColor,
                                  shape: BoxShape.circle),
                              child: Icon(AntDesign.pluscircle)))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
