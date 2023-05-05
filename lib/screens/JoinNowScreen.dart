import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:link_people/screens/AddMoreUserInfo.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/AppTextField.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';
import 'package:link_people/utils/Extensions/int_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../main.dart';
import '../utils/AppConstants.dart';

class JoinNowScreen extends StatefulWidget {
  @override
  _JoinNowScreenState createState() => _JoinNowScreenState();
}

class _JoinNowScreenState extends State<JoinNowScreen> {
  TextEditingController firstNameCont = TextEditingController();
  TextEditingController lastNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  String selectedUserType = 'Founder';
  String selectedLookingFor = 'Mentor';

  bool isAPIRunning = false;
  bool isSignUpRunning = false;

  // List of items in our dropdown menu
  var userTypes = [
    'Founder',
    'Co-Founder',
    'CxO',
    'Mentor',
  ];

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign up", style: primaryTextStyle(size: 35)),
                      SizedBox(height: 30),
                      Text("I am a", style: primaryTextStyle(size: 12)),
                      DropdownButton(
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
                      SizedBox(height: 20),
                      Text("Looking for", style: primaryTextStyle(size: 12)),
                      DropdownButton(
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
                      SizedBox(height: 10),
                      TextFormField(
                          controller: firstNameCont,
                          decoration: InputDecoration(
                              label: Text("First Name*",
                                  style: secondaryTextStyle(size: 16)),
                              labelStyle: secondaryTextStyle(),
                              focusedBorder: UnderlineInputBorder())),
                      SizedBox(height: 20),
                      TextFormField(
                          controller: lastNameCont,
                          decoration: InputDecoration(
                              label: Text("Last Name*",
                                  style: secondaryTextStyle(size: 16)),
                              labelStyle: secondaryTextStyle(),
                              focusedBorder: UnderlineInputBorder())),
                      SizedBox(height: 20),
                      TextFormField(
                          controller: emailCont,
                          decoration: InputDecoration(
                              labelText: "Email*",
                              labelStyle: secondaryTextStyle(),
                              focusedBorder: UnderlineInputBorder())),
                      /*SizedBox(height: 20),
                      AppTextField(
                          controller: userNameCont,
                          textFieldType: TextFieldType.OTHER,
                          decoration: InputDecoration(
                              labelText: "Username*",
                              labelStyle: secondaryTextStyle(),
                              focusedBorder: UnderlineInputBorder())),*/
                      SizedBox(height: 20),
                      AppTextField(
                          controller: passCont,
                          textFieldType: TextFieldType.PASSWORD,
                          decoration: InputDecoration(
                              labelText: "Password*",
                              labelStyle: secondaryTextStyle(),
                              helperText: "6 or more characters",
                              focusedBorder: UnderlineInputBorder())),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
                isAPIRunning
                    ? CircularProgressIndicator()
                    : appButton(context, 'Continue', onTap: () {
                        hideKeyboard(context);
                        //register();
                        if (firstNameCont.text.isEmpty) {
                          toast("Please enter firstname");
                        } else if (lastNameCont.text.isEmpty) {
                          toast("Please enter lastname");
                        } else if (emailCont.text.isEmpty) {
                          toast("Please enter email");
                        } else if (passCont.text.isEmpty) {
                          toast("Please enter password");
                        } else {
                          registerUsingEmailPassword(
                              emailCont.text, passCont.text);
                        }
                      }),
                12.height,
                Row(
                  children: [
                    Divider(indent: 10, endIndent: 20, thickness: 1).expand(),
                    Text('Or', style: secondaryTextStyle()),
                    Divider(indent: 20, endIndent: 10, thickness: 1).expand(),
                  ],
                ),
                12.height,
                GestureDetector(
                  onTap: () => _signWithGoogle(),
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: context.width(),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: boxDecorationWithShadowWidget(
                        backgroundColor: context.scaffoldBackgroundColor,
                        borderRadius: radius(30),
                        blurRadius: 0,
                        spreadRadius: 0,
                        border: Border.all(
                            width: 1, color: textSecondaryColorGlobal)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ic_google,
                            height: 25, width: 25, fit: BoxFit.cover),
                        8.width,
                        Text('Join now with Google', style: boldTextStyle()),
                      ],
                    ),
                  ),
                ),
                30.height,
              ],
            ),
          ),
          if (isSignUpRunning) Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }

  void registerUsingEmailPassword(String email, String password) async {
    setState(() {
      isAPIRunning = true;
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
      user = auth.currentUser;

      if (auth.currentUser != null) {
        addDetailsToUserTable(auth.currentUser!);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isAPIRunning = false;
      });
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        toast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        toast('The account already exists for that email.');
      } else {
        print(e.toString());
        toast(e.toString());
      }
    } catch (e) {
      print(e);
      toast(e.toString());
    }
  }

  void addDetailsToUserTable(User user) async {
    String userId = user.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users
        .doc(userId)
        .set({
          "userId": userId,
          "firstname": firstNameCont.text,
          "lastname": lastNameCont.text,
          "email": emailCont.text,
          "username": userNameCont.text,
          "password": passCont.text,
          "type": selectedUserType,
          "lookingFor": selectedLookingFor,
          "profile":
              "https://findmycofounders.com//wp-content//plugins//socialv-api////assets//images//default-avatar.jpg",
        })
        .then((value) => _next())
        .catchError((error) => print("Failed to add user: $error"));
  }

  void signInUsingEmailPassword(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      readDataFromUserTable(user!.uid, true);
    } on FirebaseAuthException catch (e) {
      setState(() {
        isAPIRunning = false;
      });
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        toast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
        toast('Wrong password provided.');
      } else {
        print(e.toString());
        toast(e.toString());
      }
    }
  }

  checkNullValue(value) {
    return value == null ? "" : value;
  }

  void readDataFromUserTable(String userId, bool isNew) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot snapshot = await users.doc(userId).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    prefs.setString(SharePreferencesKey.USERID, checkNullValue(userId));
    prefs.setString(
        SharePreferencesKey.FIRSTNAME, checkNullValue(data['firstname']));
    prefs.setString(
        SharePreferencesKey.LASTNAME, checkNullValue(data['lastname']));
    prefs.setString(SharePreferencesKey.EMAIL, checkNullValue(data['email']));
    prefs.setString(
        SharePreferencesKey.USERNAME, checkNullValue(data['username']));
    prefs.setString(
        SharePreferencesKey.PROFILE, checkNullValue(data['profile']));
    prefs.setString(
        SharePreferencesKey.USER_TYPE, checkNullValue(data['type']));
    prefs.setString(
        SharePreferencesKey.LOOKING_FOR, checkNullValue(data['lookingFor']));

    if (isNew) {
      await addDetailsToProfileTable();
    }
    setState(() {
      isAPIRunning = false;
      isSignUpRunning = false;
    });
    if (!isNew) {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => DashboardScreen(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return AddMoreUserInfo();
      }));
    }
  }

  Future<void> addDetailsToProfileTable() async {
    String userId = prefs.getString(SharePreferencesKey.USERID)!;

    CollectionReference profile =
        FirebaseFirestore.instance.collection('profile');
    await profile.doc(userId).set({
      "firstname": prefs.getString(SharePreferencesKey.FIRSTNAME)!,
      "lastname": prefs.getString(SharePreferencesKey.LASTNAME)!,
      "profile": prefs.getString(SharePreferencesKey.PROFILE)!,
      "designation": "",
      "lookingFor": "",
      "aboutMe": "",
      "aboutStartup": "",
      "startupAge": "",
      "stage": "",
      "funding": "",
      "website": "",
      "coreSkills": "",
      "education": [],
      "experience": [],
      "linkedIn": "",
      "facebook": "",
      "twitter": "",
    }).catchError((error) => print("Failed to add user: $error"));
  }

  _next() {
    toast("Register successfully");
    signInUsingEmailPassword(emailCont.text, passCont.text);
  }

  _signWithGoogle() async {
    setState(() {
      isSignUpRunning = true;
    });
    UserCredential userCredential = await signInWithGoogle();
    addDetailsToUserTableForGoogle(userCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void addDetailsToUserTableForGoogle(UserCredential user) async {
    if (user.user == null) {
      toast("No user found");
      setState(() {
        isSignUpRunning = false;
      });
      return;
    }
    String userId = user.user!.uid;

    if (await isUserAvailable(userId)) {
      readDataFromUserTable(userId, false);
    } else {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.doc(userId).set({
        "userId": userId,
        "firstname": user.user!.displayName,
        "lastname": "",
        "email": user.user!.email,
        "username": "",
        "password": "",
        "type": selectedUserType,
        "lookingFor": selectedLookingFor,
        "profile":
            "https://findmycofounders.com//wp-content//plugins//socialv-api////assets//images//default-avatar.jpg",
      }).then((value) {
        readDataFromUserTable(userId, true);
      }).catchError((error) {
        setState(() {
          isSignUpRunning = false;
        });
        print("Failed to add user: $error");
      });
    }
  }

  Future<bool> isUserAvailable(String userId) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot snapshot = await users.doc(userId).get();
    return snapshot.exists;
  }
}
