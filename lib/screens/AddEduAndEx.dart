import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_people/screens/AddStartUpInfo.dart';
import 'package:link_people/screens/EditProfileScreen.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Colors.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../main.dart';
import '../utils/AppConstants.dart';

class AddEduAndEx extends StatefulWidget {
  @override
  _AddEduAndExState createState() => _AddEduAndExState();
}

class _AddEduAndExState extends State<AddEduAndEx> {
  bool isEducation = false;
  bool isExperience = false;

  TextEditingController educationInstituteCont = TextEditingController();
  TextEditingController educationDegreeCont = TextEditingController();
  TextEditingController experienceDesignationCont = TextEditingController();
  TextEditingController experienceCompanyCont = TextEditingController();
  TextEditingController experienceDurationCont = TextEditingController();

  List<EducationModel> educationList = [];
  List<ExperienceModel> experienceList = [];

  @override
  void initState() {
    super.initState();
    readDataFromProfileTable();
  }

  void readDataFromProfileTable() async {
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    CollectionReference users =
        FirebaseFirestore.instance.collection('profile');
    DocumentSnapshot snapshot = await users.doc(userId).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

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

    setState(() {});
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
                  Text("Add Education & Experience",
                      style: primaryTextStyle(size: 35)),
                  SizedBox(height: 30),

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
                  SizedBox(height: 30),

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
                  SizedBox(height: 24),
                ],
              ),
            ),
            appButton(context, 'Continue', onTap: () {
              hideKeyboard(context);
              addMoreUserDetail();
            }),
          ],
        ),
      ),
    );
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

    /*DatabaseReference ref =
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
    });*/
  }

  /*void removeEducation(key) {
    educationList.clear();
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    CollectionReference education =
        FirebaseFirestore.instance.collection('profile/$userId/education/$key');
    education.doc().delete().then((value) {
      print("Education Removed of $key");
    }).catchError((error) {});

    */ /*DatabaseReference ref =
        FirebaseDatabase.instance.ref("profile/$userId/education/$key");
    ref.remove().then((value) {
      print("Education Removed of $key");
    });*/ /*
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

    /*DatabaseReference ref =
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
    });*/
  }

  /*void removeExperience(key) {
    experienceList.clear();
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    CollectionReference experience = FirebaseFirestore.instance
        .collection('profile/$userId/experience/$key');
    experience.doc().delete().then((value) {
      print("Experience Removed of $key");
    }).catchError((error) {});

    */ /*DatabaseReference ref =
        FirebaseDatabase.instance.ref("profile/$userId/experience/$key");
    ref.remove().then((value) {

    });*/ /*
  }*/

  checkNullValue(value) {
    return value == null ? "" : value;
  }

  void addMoreUserDetail() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return AddStartUpInfo();
    }));
  }
}
