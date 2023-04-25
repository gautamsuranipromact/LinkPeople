import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
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
  late Map<dynamic, dynamic> map = Map();
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

  checkNullValue(value) {
    return value == null ? "" : value;
  }

  checkNullArray(value) {
    return value == null ? [] : value;
  }

  Future<String> uploadPic() async {
    FirebaseStorage _storage = FirebaseStorage.instance;

    XFile? s = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 1800, maxHeight: 1800);

    String fileName = path.basename(s!.path);

    //Create a reference to the location you want to upload to in firebase
    Reference reference = _storage.ref().child("images/profile/" +
        prefs.getString(SharePreferencesKey.USERID)! +
        "/" +
        fileName);

    //Upload the file to firebase
    UploadTask uploadTask = reference.putFile(File(s.path));

    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();

    //returns the download url
    return imageUrl;
  }

  @override
  void initState() {
    super.initState();
    readDataFromProfileTable();
  }

  Future<String> readDataFromProfileTable() async {
    String userId = prefs.getString(SharePreferencesKey.USERID)!;
    DatabaseReference ref = FirebaseDatabase.instance.ref("profile/$userId");
    ref.onValue.listen((DatabaseEvent event) {
      educationList.clear();
      experienceList.clear();
      print("Profile Data:" + event.snapshot.value.toString());
      map = event.snapshot.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        print("Key: " + key.toString());
        print("Value:" + value.toString());
      });
      print("Education:" + map['education'].toString());
      final educationMap = map["education"] == null
          ? Map()
          : map["education"] as Map<dynamic, dynamic>;
      final experienceMap = map["experience"] == null
          ? Map()
          : map["experience"] as Map<dynamic, dynamic>;
      educationMap.forEach((key, value) {
        educationList.add(EducationModel(
            key: key,
            image: value['image'],
            degree: value['degree'],
            name: value['name']));
      });
      experienceMap.forEach((key, value) {
        experienceList.add(ExperienceModel(
            key: key,
            image: value['image'],
            duration: value['duration'],
            company: value['company'],
            designation: value['designation']));
      });

      firstNameCont.text = checkNullValue(map['firstname']);
      lastNameCont.text = checkNullValue(map['lastname']);
      designationCont.text = checkNullValue(map['designation']);
      lookingForCont.text = checkNullValue(map['lookingFor']);
      aboutMeCont.text = checkNullValue(map['aboutMe']);
      aboutStartUpCont.text = checkNullValue(map['aboutStartup']);
      startUpAgeCont.text = checkNullValue(map['startupAge']);
      stageCont.text = checkNullValue(map['stage']);
      fundingCont.text = checkNullValue(map['funding']);
      websiteCont.text = checkNullValue(map['website']);
      coreSkillsCont.text = checkNullValue(map['coreSkills']);
      linkedInCont.text = checkNullValue(map['linkedIn']);
      facebookCont.text = checkNullValue(map['facebook']);
      twitterCont.text = checkNullValue(map['twitter']);

      setState(() {});
    });
    return "";
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
          child: Text("Edit Profile", style: TextStyle(color: Colors.white)),
        ),
        isNew: true,
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
                            image: AssetImage(ic_microsoft), fit: BoxFit.fill)),
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
                                  addEducation(educationInstituteCont.text, "",
                                      educationDegreeCont.text);
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
                                          color: coverColor,
                                          fontSize: 14,
                                          fontFamily: robotoRegular,
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        checkNullValue(data.degree),
                                        style: TextStyle(
                                          color: coverColor,
                                          fontSize: 12,
                                          fontFamily: robotoRegular,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      removeEducation(checkNullValue(data.key));
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
                                  addExperience(
                                      experienceDesignationCont.text,
                                      "",
                                      experienceCompanyCont.text,
                                      experienceDurationCont.text);
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
                                          color: coverColor,
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
                                          color: coverColor,
                                          fontSize: 12,
                                          fontFamily: robotoRegular,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      removeExperience(
                                          checkNullValue(data.key));
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
    DatabaseReference refUser = FirebaseDatabase.instance.ref("users/$userId");
    refUser.update({
      "firstname": firstNameCont.text,
      "lastname": lastNameCont.text,
      "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
    });
    DatabaseReference ref = FirebaseDatabase.instance.ref("profile/$userId");
    ref.update({
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

  void addEducation(name, image, degree) {
    educationList.clear();
    experienceList.clear();
    String userId = prefs.getString(SharePreferencesKey.USERID)!;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("profile/$userId/education");
    DatabaseReference newEducationRef = ref.push();
    newEducationRef.set({
      "name": name,
      "image": image,
      "degree": degree,
    }).whenComplete(() {
      educationInstituteCont.text = "";
      educationDegreeCont.text = "";
      print("Education Updated");
    });
  }

  void removeEducation(key) {
    educationList.clear();
    experienceList.clear();
    String userId = prefs.getString(SharePreferencesKey.USERID)!;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("profile/$userId/education/$key");
    ref.remove().then((value) {
      print("Education Removed of $key");
    });
  }

  void addExperience(designation, image, company, duration) {
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
  }

  void removeExperience(key) {
    educationList.clear();
    experienceList.clear();
    String userId = prefs.getString(SharePreferencesKey.USERID)!;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("profile/$userId/experience/$key");
    ref.remove().then((value) {
      print("Experience Removed of $key");
    });
  }

  void addDetailsToProfileTable() async {
    String userId = prefs.getString(SharePreferencesKey.USERID)!;
    DatabaseReference ref = FirebaseDatabase.instance.ref("profile/$userId");
    await ref.set({
      "firstname": prefs.getString(SharePreferencesKey.FIRSTNAME)!,
      "lastname": prefs.getString(SharePreferencesKey.LASTNAME)!,
      "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
      "designation": "Chief Executive Officer at Microsoft",
      "lookingFor":
          "I am a Founder looking for a Non-Tech Co-Founder who has a Branding and Marketing background. He should have experience in E-com, B2B sales and networking. He should be ready to relocate to Vadodara full time. ",
      "aboutMe":
          "I am an IIT graduate in Computer Science and have worked with Fortune 500 companies like IBM and Apple as their Tech Lead. I love cricket and football. I like to read in my free time. I am also interested in learning about physics and philosophy.",
      "aboutStartup":
          "My startup is a bootstrapped startup operating in kids’ furniture and toys. It is a revenue generating and profitable startup. I am willing to offer equity but no compensation till we hit certain profitability benchmarks. ",
      "startupAge": "19 years",
      "stage": "Revenue Generating",
      "funding": "Bootstrapped",
      "website": "www.about.meta.com",
      "coreSkills":
          "Equanimity, Critical thinking, Problem-solving, Effective communication, Assertiveness",
      "education": [
        {
          "image": "",
          "name": "Manipal Institute of Technology",
          "degree": "Bachelor’s Degree, Electrical Engineering"
        },
        {
          "image": "",
          "name": "University of Wisconsin-Milwaukee",
          "degree": "Master’s Degree, Computer Science"
        },
      ],
      "experience": [
        {
          "image": "",
          "name": "Chairman and CEO",
          "company": "Microsoft",
          "duration": "Feb 2014 - Present · 9 yrs 3 mos"
        },
        {
          "image": "",
          "name": "Chairman",
          "company": "The Business Council U.S.",
          "duration": "2021 - Present · 2 yrs 4 mos"
        },
        {
          "image": "",
          "name": "Member Board Of Trustees",
          "company": "University of Chicago",
          "duration": "2018 - Present · 5 yrs 4 mos"
        },
        {
          "image": "",
          "name": "Board Member",
          "company": "Starbucks",
          "duration": "2017 - Present · 6 yrs 4 mos"
        },
        {
          "image": "",
          "name": "Board Member",
          "company": "Fred Hutch",
          "duration": "2016 - 2022 · 6 yrs"
        },
      ],
    }).whenComplete(() {
      print("Profile Submitted successfully");
    });
  }

  getFromCamera() async {
    String path = await uploadPic();
    if (path != null) {
      prefs.setString(SharePreferencesKey.PROFILE, path);
      setState(() {});
    }
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
