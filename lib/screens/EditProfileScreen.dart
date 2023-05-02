import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:link_people/components/ProfileComponent.dart';
import 'package:link_people/main.dart';
import 'package:link_people/utils/AppColors.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:link_people/utils/Extensions/Colors.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import 'package:path/path.dart' as path;

import '../utils/AppImages.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late Map<dynamic, dynamic> data = Map();
  List<EducationModel> educationList = [];
  List<ExperienceModel> experienceList = [];

  TextEditingController firstNameCont = TextEditingController();
  TextEditingController lastNameCont = TextEditingController();
  TextEditingController designationCont = TextEditingController();
  TextEditingController lookingForCont = TextEditingController();
  TextEditingController aboutMeCont = TextEditingController();
  TextEditingController aboutStartUpCont = TextEditingController();
  TextEditingController startUpAgeCont = TextEditingController();
  TextEditingController stageCont = TextEditingController();
  TextEditingController fundingCont = TextEditingController();
  TextEditingController websiteCont = TextEditingController();
  TextEditingController coreSkillsCont = TextEditingController();
  TextEditingController educationInstituteCont = TextEditingController();
  TextEditingController educationDegreeCont = TextEditingController();
  TextEditingController experienceDesignationCont = TextEditingController();
  TextEditingController experienceCompanyCont = TextEditingController();
  TextEditingController experienceDurationCont = TextEditingController();
  TextEditingController linkedInCont = TextEditingController();
  TextEditingController facebookCont = TextEditingController();
  TextEditingController twitterCont = TextEditingController();

  bool isEducation = false;
  bool isExperience = false;
  bool isProfileRunning = false;

  String selectedUserType = 'Founder';
  String selectedLookingFor = 'Mentor';

  var userTypes = [
    'Founder',
    'Co-Founder',
    'CxO',
    'Mentor',
  ];

  checkNullValue(value) {
    return value == null ? "" : value;
  }

  checkNullArray(value) {
    return value == null ? [] : value;
  }

  @override
  void initState() {
    super.initState();
    selectedUserType = prefs.getString(SharePreferencesKey.USER_TYPE)!;
    selectedLookingFor = prefs.getString(SharePreferencesKey.LOOKING_FOR)!;
    readDataFromProfileTable();
  }

  void readDataFromProfileTable() async {
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    CollectionReference users =
        FirebaseFirestore.instance.collection('profile');
    DocumentSnapshot snapshot = await users.doc(userId).get();
    data = snapshot.data() as Map<String, dynamic>;
    final educationListData =
    data["education"] == null ? [] : data["education"] as List<dynamic>;
    final experienceListData =
    data["experience"] == null ? [] : data["experience"] as List<dynamic>;
    for (int i = 0; i < educationListData.length; i++) {
      final map = educationListData.elementAt(i);
      educationList.add(EducationModel(
          image: map['image'], degree: map['degree'], name: map['name']));
    }
    for (int i = 0; i < experienceListData.length; i++) {
      final map = experienceListData.elementAt(i);
      experienceList.add(ExperienceModel(
          image: map['image'],
          duration: map['duration'],
          company: map['company'],
          designation: map['designation']));
    }

    firstNameCont.text = checkNullValue(data['firstname']);
    lastNameCont.text = checkNullValue(data['lastname']);
    designationCont.text = checkNullValue(data['designation']);
    lookingForCont.text = checkNullValue(data['lookingFor']);
    aboutMeCont.text = checkNullValue(data['aboutMe']);
    aboutStartUpCont.text = checkNullValue(data['aboutStartup']);
    startUpAgeCont.text = checkNullValue(data['startupAge']);
    stageCont.text = checkNullValue(data['stage']);
    fundingCont.text = checkNullValue(data['funding']);
    websiteCont.text = checkNullValue(data['website']);
    coreSkillsCont.text = checkNullValue(data['coreSkills']);
    linkedInCont.text = checkNullValue(data['linkedIn']);
    facebookCont.text = checkNullValue(data['facebook']);
    twitterCont.text = checkNullValue(data['twitter']);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(
        context,
        "",
        () {
          Navigator.pop(context);
        },
        centerWidget: Container(
          child: Text("Edit Profile", style: TextStyle(color: Colors.black)),
        ),
        isNew: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Profile Section
            Container(
              height: 175,
              child:

                  /// Circle Profile Image Section
                  Stack(
                children: [
                  /// Background Image
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2021/03/LinkedIn-Default-Background-2020-.jpg"),
                            fit: BoxFit.fill)),
                    height: 150,
                  ),

                  /// Transparent Blue cover
                  Container(
                    height: 150,
                    color: coverColor,
                  ),

                  /// Round Profile Picture
                  GestureDetector(
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
                                          borderRadius: radius(), color: grey2),
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
                      margin: EdgeInsets.only(top: 30, left: 30),
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
                ],
              ),
            ),

            /// Profile Details Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text("I am a", style: primaryTextStyle(size: 12)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: greyColor, style: BorderStyle.solid, width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: selectedUserType,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: userTypes.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? value) {
                          setState(() {
                            selectedUserType = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child:
                        Text("Looking for", style: primaryTextStyle(size: 12)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: greyColor, style: BorderStyle.solid, width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        value: selectedLookingFor,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: userTypes.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? value) {
                          setState(() {
                            selectedLookingFor = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  /// FirstName
                  Text(
                    "First Name",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: firstNameCont,
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
                      hintText: 'First Name',
                    ),
                  ),
                  SizedBox(height: 10),

                  /// LastName
                  Text(
                    "Last Name",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: lastNameCont,
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
                      hintText: 'Last Name',
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Designation
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
                  SizedBox(height: 10),

                  /// Looking For...
                  Text(
                    "Looking for in detail",
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
                      hintText: "Looking for",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// About Me
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
                  SizedBox(height: 10),

                  /// About Startup
                  Text(
                    "About Startup",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: aboutStartUpCont,
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
                      hintText: "About Startup",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Startup Age
                  Text(
                    "Startup Age",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: startUpAgeCont,
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
                      hintText: "Startup Age",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Stage
                  Text(
                    "Stage",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: stageCont,
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
                      hintText: "Stage",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Funding
                  Text(
                    "Funding",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: fundingCont,
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
                      hintText: "Funding",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Website
                  Text(
                    "Website",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: websiteCont,
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
                      hintText: "Website",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Core skills
                  Text(
                    "Core skills",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: coreSkillsCont,
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
                  SizedBox(height: 10),

                  /// Education
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Education",
                        style: TextStyle(
                          color: lightGreyColor,
                          fontSize: 14,
                          fontFamily: robotoRegular,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              if (isEducation)
                                isEducation = false;
                              else
                                isEducation = true;
                            });
                          },
                          child: Icon(
                            isEducation ? Icons.cancel_outlined : Icons.add,
                            size: 20,
                          ))
                    ],
                  ),

                  /// Add Education
                  isEducation
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Institute",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                            ),
                            SizedBox(height: 6),
                            TextField(
                              controller: educationInstituteCont,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                hintText: "Institute",
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Degree",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                            ),
                            SizedBox(height: 6),
                            TextField(
                              controller: educationDegreeCont,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                hintText: "Degree",
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                                onPressed: () {
                                  educationList.add(EducationModel(
                                      name: educationInstituteCont.text,
                                      image: "",
                                      degree: educationDegreeCont.text));
                                  addEducation();
                                  setState(() {
                                    isEducation = false;
                                  });
                                },
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: lightBlackColor,
                                      fontFamily: robotoRegular),
                                )),
                            SizedBox(height: 10),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 10),

                  ListView.builder(
                      itemCount: educationList.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        EducationModel data = educationList[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: viewLineColor),
                                      image: DecorationImage(
                                          image: AssetImage(ic_placeHolder))),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        checkNullValue(
                                            checkNullValue(data.name)),
                                        style: TextStyle(
                                          color: lightBlackColor,
                                          fontSize: 14,
                                          fontFamily: robotoRegular,
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        checkNullValue(data.degree),
                                        style: TextStyle(
                                          color: lightBlackColor,
                                          fontSize: 12,
                                          fontFamily: robotoRegular,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      educationList.removeAt(index);
                                      addEducation();
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 20,
                                    ))
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        );
                      }),
                  SizedBox(height: 10),

                  /// Experience
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Experience",
                        style: TextStyle(
                          color: lightGreyColor,
                          fontSize: 14,
                          fontFamily: robotoRegular,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              if (isExperience)
                                isExperience = false;
                              else
                                isExperience = true;
                            });
                          },
                          child: Icon(
                            isExperience ? Icons.cancel_outlined : Icons.add,
                            size: 20,
                          ))
                    ],
                  ),

                  /// Add Experience
                  isExperience
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Company",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                            ),
                            SizedBox(height: 6),
                            TextField(
                              controller: experienceCompanyCont,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                hintText: "Company",
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Designation",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                            ),
                            SizedBox(height: 6),
                            TextField(
                              controller: experienceDesignationCont,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                hintText: "Designation",
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Duration",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                            ),
                            SizedBox(height: 6),
                            TextField(
                              controller: experienceDurationCont,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: lightBlackColor,
                                  fontFamily: robotoRegular),
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: greyColor, width: 1.0),
                                ),
                                hintText: "Duration",
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                                onPressed: () {
                                  experienceList.add(ExperienceModel(
                                      image: "",
                                      company: experienceCompanyCont.text,
                                      designation:
                                          experienceDesignationCont.text,
                                      duration: experienceDurationCont.text));
                                  addExperience();
                                  setState(() {
                                    isExperience = false;
                                  });
                                },
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: lightBlackColor,
                                      fontFamily: robotoRegular),
                                )),
                            SizedBox(height: 10),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 10),

                  ListView.builder(
                      itemCount: experienceList.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        ExperienceModel data = experienceList[index];
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: viewLineColor),
                                      image: DecorationImage(
                                          image: AssetImage(ic_placeHolder))),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        checkNullValue(data.designation),
                                        style: TextStyle(
                                          color: lightBlackColor,
                                          fontSize: 14,
                                          fontFamily: robotoRegular,
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        checkNullValue(data.company) +
                                            "\n" +
                                            checkNullValue(data.duration),
                                        style: TextStyle(
                                          color: lightBlackColor,
                                          fontSize: 12,
                                          fontFamily: robotoRegular,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      experienceList.removeAt(index);
                                      addExperience();
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 20,
                                    ))
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        );
                      }),
                  SizedBox(height: 20),

                  /// LinkedIn
                  Text(
                    "LinkedIn",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: linkedInCont,
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
                      hintText: "LinkedIn",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Facebook
                  Text(
                    "Facebook",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: facebookCont,
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
                      hintText: "Facebook",
                    ),
                  ),
                  SizedBox(height: 10),

                  /// Twitter
                  Text(
                    "Twitter",
                    style: TextStyle(
                        fontSize: 12,
                        color: lightBlackColor,
                        fontFamily: robotoRegular),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    controller: twitterCont,
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
                      hintText: "Twitter",
                    ),
                  ),
                  SizedBox(height: 20),

                  /// Update Button
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          updateProfile();
                        },
                        child: Container(
                          height: 50,
                          width: 300,
                          child: Center(
                            child: Text("UPDATE",
                                style: TextStyle(
                                    fontFamily: robotoRegular,
                                    color: Colors.white,
                                    fontSize: 12)),
                          ),
                          decoration: BoxDecoration(
                              color: orangeColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateProfile() async {
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    prefs.setString(SharePreferencesKey.USER_TYPE, selectedUserType);
    prefs.setString(SharePreferencesKey.LOOKING_FOR, selectedLookingFor);
    CollectionReference refUser =
        FirebaseFirestore.instance.collection('users');
    refUser.doc(userId).update({
      "firstname": firstNameCont.text,
      "lastname": lastNameCont.text,
      "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
      "type": selectedUserType,
      "lookingFor": selectedLookingFor,
    });

    CollectionReference ref = FirebaseFirestore.instance.collection('profile');
    ref.doc(userId).update({
      "firstname": firstNameCont.text,
      "lastname": lastNameCont.text,
      "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
      "designation": designationCont.text,
      "lookingFor": lookingForCont.text,
      "aboutMe": aboutMeCont.text,
      "aboutStartup": aboutStartUpCont.text,
      "startupAge": startUpAgeCont.text,
      "stage": stageCont.text,
      "funding": fundingCont.text,
      "website": websiteCont.text,
      "coreSkills": coreSkillsCont.text,
      "linkedIn": linkedInCont.text,
      "facebook": facebookCont.text,
      "twitter": twitterCont.text,
    }).whenComplete(() {
      finish(context);
      print("Profile Updated");
    });
  }

  void addEducation() {
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    CollectionReference education =
        FirebaseFirestore.instance.collection('profile');
    List<dynamic> array = [];
    for (int i = 0; i < educationList.length; i++) {
      array.add({
        "name": educationList.elementAt(i).name,
        "image": educationList.elementAt(i).image,
        "degree": educationList.elementAt(i).degree,
      });
    }
    education.doc(userId).update({"education": array}).then((value) {
      educationInstituteCont.text = "";
      educationDegreeCont.text = "";
      print("Education Updated");
      setState(() {});
    }).catchError((error) {
      setState(() {});
    });
  }

  /*void removeEducation(key) {
    educationList.clear();
    experienceList.clear();
    String userId = prefs.getString(SharePreferencesKey.USERID)!;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("profile/$userId/education/$key");
    ref.remove().then((value) {
      print("Education Removed of $key");
    });
  }*/

  /*void addExperience(designation, image, company, duration) {
    educationList.clear();
    experienceList.clear();
    String userId = prefs.getString(SharePreferencesKey.USERID)!;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("profile/$userId/experience");
    DatabaseReference newEducationRef = ref.push();
    newEducationRef.set({
      "designation": designation,
      "image": image,
      "company": company,
      "duration": duration,
    }).whenComplete(() {
      experienceCompanyCont.text = "";
      experienceDesignationCont.text = "";
      experienceDurationCont.text = "";
      print("Education Updated");
    });
  }*/

  void addExperience() {
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    CollectionReference experience =
        FirebaseFirestore.instance.collection('profile');

    List<dynamic> array = [];
    for (int i = 0; i < experienceList.length; i++) {
      array.add({
        "designation": experienceList.elementAt(i).designation,
        "image": experienceList.elementAt(i).image,
        "company": experienceList.elementAt(i).company,
        "duration": experienceList.elementAt(i).duration,
      });
    }

    experience.doc(userId).update({
      "experience": array,
    }).then((value) {
      experienceCompanyCont.text = "";
      experienceDesignationCont.text = "";
      experienceDurationCont.text = "";
      print("Education Updated");
      setState(() {});
    }).catchError((error) {
      setState(() {});
    });
  }

  /*void removeExperience(key) {
    educationList.clear();
    experienceList.clear();
    String userId = prefs.getString(SharePreferencesKey.USERID)!;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("profile/$userId/experience/$key");
    ref.remove().then((value) {
      print("Experience Removed of $key");
    });
  }*/

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
    setState(() {
      isProfileRunning = false;
    });
    return imageUrl;
  }
}

class EducationModel {
  String? key;
  String? name;
  String? image;
  String? degree;

  EducationModel({
    this.key,
    this.name,
    this.image,
    this.degree,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
        key: json['key'],
        name: json['name'],
        image: json['image'],
        degree: json['degree']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    data['image'] = this.image;
    data['degree'] = this.degree;
    return data;
  }
}

class ExperienceModel {
  String? key;
  String? company;
  String? duration;
  String? image;
  String? designation;

  ExperienceModel({
    this.key,
    this.designation,
    this.image,
    this.company,
    this.duration,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
        key: json['key'],
        designation: json['designation'],
        image: json['image'],
        company: json['company'],
        duration: json['duration']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['designation'] = this.designation;
    data['image'] = this.image;
    data['company'] = this.company;
    data['duration'] = this.duration;
    return data;
  }
}
