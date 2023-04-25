import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/main.dart';
import 'package:link_people/screens/EditProfileScreen.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:link_people/utils/Extensions/Colors.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/AppImages.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Map<dynamic, dynamic> map = Map();
  List<EducationModel> educationList = [];
  List<ExperienceModel> experienceList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readDataFromProfileTable();
  }

  void readDataFromProfileTable() {
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
      setState(() {});
    });
  }

  checkNullValue(value) {
    return value == null ? "" : value;
  }

  checkNullArray(value) {
    return value == null ? [] : value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarCommon(
        context,
        "",
        () {
          Navigator.pop(context);
        },
        centerWidget: GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return SearchScreen(text: "Search");
            // }));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(6),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Icon(FontAwesome.search, size: 16, color: context.iconColor),
                SizedBox(width: 10),
                Text("Search", style: primaryTextStyle()),
              ],
            ),
          ),
        ),
        action: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditProfileScreen();
              }));
            },
            child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                )),
          )
        ],
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
                  Container(
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

                  /// Connect Button
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                          height: 26,
                          width: 100,
                          child: Center(
                            child: Text("CONNECT",
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
                  /// Name
                  checkNullValue(map['firstname']) != ""
                      ? Text(
                          checkNullValue(map['firstname']) +
                              " " +
                              checkNullValue(map['lastname']),
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: robotoBold,
                              fontWeight: FontWeight.bold),
                        )
                      : Container(),
                  SizedBox(height: 5),

                  /// Designation
                  checkNullValue(map['designation']) != ""
                      ? Text(
                          checkNullValue(map['designation']),
                          style: TextStyle(
                              color: lightBlackColor,
                              fontSize: 14,
                              fontFamily: robotoRegular),
                        )
                      : Container(),

                  /// Looking For...
                  checkNullValue(map['lookingFor']) != ""
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(top: 16),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: greyColor)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Looking for",
                                    style: TextStyle(
                                        color: lightGreyColor,
                                        fontSize: 14,
                                        fontFamily: robotoRegular),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    checkNullValue(map['lookingFor']),
                                    style: TextStyle(
                                        color: lightBlackColor,
                                        fontSize: 14,
                                        fontFamily: robotoRegular),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        )
                      : Container(),

                  /// About Me
                  checkNullValue(map['aboutMe']) != ""
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About Me",
                              style: TextStyle(
                                  color: lightGreyColor,
                                  fontSize: 14,
                                  fontFamily: robotoRegular),
                            ),
                            SizedBox(height: 5),

                            /// Description
                            Text(
                              checkNullValue(map['aboutMe']),
                              style: TextStyle(
                                color: lightBlackColor,
                                fontSize: 13,
                                fontFamily: robotoRegular,
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        )
                      : Container(),

                  /// About Startup
                  checkNullValue(map['aboutStartup']) != ""
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About Startup",
                              style: TextStyle(
                                  color: lightGreyColor,
                                  fontSize: 14,
                                  fontFamily: robotoRegular),
                            ),
                            SizedBox(height: 5),

                            /// Description
                            Text(
                              checkNullValue(map['aboutStartup']),
                              style: TextStyle(
                                color: lightBlackColor,
                                fontSize: 13,
                                fontFamily: robotoRegular,
                              ),
                            ),
                            SizedBox(height: 20),

                            /// Divider
                            Container(
                              height: 1,
                              color: viewLineColor,
                            ),
                            SizedBox(height: 10),
                          ],
                        )
                      : Container(),

                  /// Startup Age
                  checkNullValue(map['startupAge']) != ""
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                "Startup age",
                                style: TextStyle(
                                  color: lightGreyColor,
                                  fontSize: 14,
                                  fontFamily: robotoRegular,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                checkNullValue(map['startupAge']),
                                style: TextStyle(
                                  color: lightBlackColor,
                                  fontSize: 14,
                                  fontFamily: robotoRegular,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 1,
                                color: viewLineColor,
                              ),
                            ])
                      : Container(),

                  /// Stage and Funding
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      checkNullValue(map['stage']) != ""
                          ? Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Stage",
                                      style: TextStyle(
                                        color: lightGreyColor,
                                        fontSize: 14,
                                        fontFamily: robotoRegular,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      checkNullValue(map['stage']),
                                      style: TextStyle(
                                        color: lightBlackColor,
                                        fontSize: 14,
                                        fontFamily: robotoRegular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      checkNullValue(map['stage']) != "" &&
                              checkNullValue(map['funding']) != ""
                          ? Container(
                              color: viewLineColor,
                              width: 1,
                              height: 40,
                            )
                          : Container(),
                      checkNullValue(map['funding']) != ""
                          ? Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Funding",
                                      style: TextStyle(
                                        color: lightGreyColor,
                                        fontSize: 14,
                                        fontFamily: robotoRegular,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      checkNullValue(map['funding']),
                                      style: TextStyle(
                                        color: lightBlackColor,
                                        fontSize: 14,
                                        fontFamily: robotoRegular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),

                  /// Website
                  checkNullValue(map['website']) != ""
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 1,
                              color: viewLineColor,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Website",
                                      style: TextStyle(
                                        color: lightGreyColor,
                                        fontSize: 14,
                                        fontFamily: robotoRegular,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      checkNullValue(map['website']),
                                      style: TextStyle(
                                        color: linkColor,
                                        fontSize: 14,
                                        fontFamily: robotoRegular,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    openUrl(checkNullValue(map["website"]));
                                  },
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Image.asset(
                                        ic_link,
                                        height: 16,
                                        width: 16,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 1,
                              color: viewLineColor,
                            ),
                          ],
                        )
                      : Container(),

                  /// Core Skills
                  checkNullValue(map['coreSkills']) != ""
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "Core skills",
                              style: TextStyle(
                                color: lightGreyColor,
                                fontSize: 14,
                                fontFamily: robotoRegular,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              checkNullValue(map['coreSkills']),
                              style: TextStyle(
                                color: lightBlackColor,
                                fontSize: 14,
                                fontFamily: robotoRegular,
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        )
                      : Container(),

                  /// Education
                  educationList.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Education",
                              style: TextStyle(
                                color: lightGreyColor,
                                fontSize: 14,
                                fontFamily: robotoRegular,
                              ),
                            ),
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
                                                border: Border.all(
                                                    color: viewLineColor),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        ic_placeHolder))),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  checkNullValue(data.name)!,
                                                  style: TextStyle(
                                                    color: coverColor,
                                                    fontSize: 14,
                                                    fontFamily: robotoRegular,
                                                  ),
                                                ),
                                                SizedBox(width: 2),
                                                Text(
                                                  checkNullValue(data.degree)!,
                                                  style: TextStyle(
                                                    color: coverColor,
                                                    fontSize: 12,
                                                    fontFamily: robotoRegular,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  );
                                }),
                            SizedBox(height: 10),
                          ],
                        )
                      : Container(),

                  /// Experience
                  experienceList.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Experience",
                              style: TextStyle(
                                color: lightGreyColor,
                                fontSize: 14,
                                fontFamily: robotoRegular,
                              ),
                            ),
                            SizedBox(height: 10),
                            ListView.builder(
                                itemCount: experienceList.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  ExperienceModel data = experienceList[index];
                                  return Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: viewLineColor),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        ic_placeHolder))),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  checkNullValue(
                                                      data.designation!),
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
                                                      checkNullValue(
                                                          data.duration),
                                                  style: TextStyle(
                                                    color: coverColor,
                                                    fontSize: 12,
                                                    fontFamily: robotoRegular,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  );
                                }),
                            SizedBox(height: 20),
                          ],
                        )
                      : Container(),

                  /// Social Profile
                  checkNullValue(map["linkedIn"]) != "" ||
                          checkNullValue(map["facebook"]) != "" ||
                          checkNullValue(map["twitter"]) != ""
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Social Profile",
                              style: TextStyle(
                                color: lightGreyColor,
                                fontSize: 14,
                                fontFamily: robotoRegular,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                /// Linkedin
                                checkNullValue(map["linkedIn"]) != ""
                                    ? Column(
                                        children: [
                                          InkWell(
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: linkedinColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                              ),
                                              child: Image.asset(
                                                ic_linkedin,
                                                height: 5,
                                                width: 5,
                                              ),
                                            ),
                                            onTap: () {
                                              openUrl(checkNullValue(
                                                  map["linkedIn"]));
                                            },
                                          ),
                                        ],
                                      )
                                    : Container(),

                                SizedBox(width: 10),

                                /// Facebook
                                checkNullValue(map["facebook"]) != ""
                                    ? Column(
                                        children: [
                                          InkWell(
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: facebookColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                              ),
                                              child: Image.asset(
                                                ic_facebook,
                                                height: 5,
                                                width: 5,
                                              ),
                                            ),
                                            onTap: () {
                                              openUrl(checkNullValue(
                                                  map["facebook"]));
                                            },
                                          ),
                                        ],
                                      )
                                    : Container(),
                                SizedBox(width: 10),

                                /// Twitter
                                checkNullValue(map["twitter"]) != ""
                                    ? Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              openUrl(checkNullValue(
                                                  map["twitter"]));
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: twitterColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                              ),
                                              child: Image.asset(
                                                ic_twitter,
                                                height: 5,
                                                width: 5,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    Uri uri = Uri.parse(url);
    if (url == "") {
      toast("URL not found...");
      return;
    }
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
      // <--
      throw Exception('Could not launch $_url');
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
