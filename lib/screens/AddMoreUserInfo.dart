import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:link_people/components/ProfileComponent.dart';
import 'package:link_people/screens/AddEduAndEx.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Colors.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../main.dart';
import '../utils/AppConstants.dart';
import 'package:path/path.dart' as path;

class AddMoreUserInfo extends StatefulWidget {
  @override
  _AddMoreUserInfoState createState() => _AddMoreUserInfoState();
}

class _AddMoreUserInfoState extends State<AddMoreUserInfo> {
  TextEditingController designationCont = TextEditingController();
  TextEditingController lookingForCont = TextEditingController();
  TextEditingController aboutMeCont = TextEditingController();
  TextEditingController coreSkillCont = TextEditingController();
  bool isAPIRunning = false;
  bool isProfileRunning = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: context.scaffoldBackgroundColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Padding(
              padding: EdgeInsets.only(left: 0, top: 16),
              child: appStore.isDarkMode
                  ? Image.asset(ic_logo_light, height: 25, fit: BoxFit.cover)
                  : Image.asset(ic_logo, height: 25, fit: BoxFit.cover))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add your more information",
                      style: primaryTextStyle(size: 35)),
                  SizedBox(height: 30),
                  Center(
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
                                        onTap: () => getFromCamera(),
                                        icon: Ionicons.camera,
                                        isSubtext: false),
                                    bottomSheetComponent(context,
                                        text: "Upload from Photos",
                                        subtext:
                                            "On Find My CoFounder, we require members to use their real identities, so upload a photo of yourself",
                                        onTap: () => getFromGallery(),
                                        icon: Ionicons.images_outline,
                                        isSubtext: false),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                        width: 90.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            //image: AssetImage(ic_placeHolder),
                            image: NetworkImage(
                                prefs.getString(SharePreferencesKey.PROFILE)!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.8,
                          ),
                        ),
                        child: isProfileRunning
                            ? Center(child: CircularProgressIndicator())
                            : Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Designation",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: designationCont,
                    style: TextStyle(
                        fontSize: 14,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      hintText: 'Designation',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Looking for",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: lookingForCont,
                    style: TextStyle(
                        fontSize: 14,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                    maxLines: 3,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      hintText: "Looking for in detail",
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "About Me",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: aboutMeCont,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 14,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      hintText: "About Me",
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Core skills",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: coreSkillCont,
                    style: TextStyle(
                        fontSize: 14,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor, width: 1.0),
                      ),
                      hintText: "Core skills",
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
            isAPIRunning
                ? CircularProgressIndicator()
                : appButton(context, 'Continue', onTap: () {
                    hideKeyboard(context);
                    //register();
                    if (designationCont.text.isEmpty) {
                      toast("Please enter Designation");
                    } else if (lookingForCont.text.isEmpty) {
                      toast("Please enter Looking for in detail");
                    } else if (aboutMeCont.text.isEmpty) {
                      toast("Please enter about me");
                    } else if (coreSkillCont.text.isEmpty) {
                      toast("Please enter core skill");
                    } else {
                      addMoreUserDetail();
                    }
                  }),
          ],
        ),
      ),
    );
  }

  checkNullValue(value) {
    return value == null ? "" : value;
  }

  void addMoreUserDetail() {
    setState(() {
      isAPIRunning = true;
    });
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(userId).update({
      "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
    }).catchError((error) => print("Failed to add user: $error"));

    CollectionReference profile =
        FirebaseFirestore.instance.collection('profile');
    profile
        .doc(userId)
        .update({
          "designation": designationCont.text,
          "lookingFor": lookingForCont.text,
          "aboutMe": aboutMeCont.text,
          "coreSkills": coreSkillCont.text,
          "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
        })
        .then((value) => _next())
        .catchError((error) => _error());

    /*DatabaseReference refUser = FirebaseDatabase.instance.ref("users/$userId");
    refUser.update({
      "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
    });
    DatabaseReference ref = FirebaseDatabase.instance.ref("profile/$userId");
    ref.update({
      "designation": designationCont.text,
      "lookingFor": lookingForCont.text,
      "aboutMe": aboutMeCont.text,
      "coreSkills": coreSkillCont.text,
      "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
    }).whenComplete(() {
      setState(() {
        isAPIRunning = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return AddEduAndEx();
      }));
    });*/
  }

  getFromCamera() async {
    XFile? s = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800);
    String path = await uploadPic(s);
    if (path.isNotEmpty) {
      prefs.setString(SharePreferencesKey.PROFILE, path);
      setState(() {});
    }
  }

  void getFromGallery() async {
    XFile? s = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800);
    String path = await uploadPic(s);
    if (path.isNotEmpty) {
      prefs.setString(SharePreferencesKey.PROFILE, path);
      setState(() {});
    }
  }

  Future<String> uploadPic(XFile? s) async {
    setState(() {
      isProfileRunning = true;
    });
    String imageUrl = "";
    try {
      FirebaseStorage _storage = FirebaseStorage.instance;

      String fileName = path.basename(s!.path);

      //Create a reference to the location you want to upload to in firebase
      Reference reference = _storage.ref().child("images/profile/" +
          prefs.getString(SharePreferencesKey.USERID)! +
          "/" +
          fileName);

      //Upload the file to firebase
      UploadTask uploadTask = reference.putFile(File(s.path));

      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
    } catch (e) {}

    //returns the download url
    setState(() {
      isProfileRunning = false;
    });
    return imageUrl;
  }

  _next() {
    setState(() {
      isAPIRunning = false;
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return AddEduAndEx();
    }));
  }

  _error() {
    setState(() {
      isAPIRunning = false;
    });
    print("Failed to add profile");
  }
}
