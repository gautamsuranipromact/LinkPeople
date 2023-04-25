import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/AppTextField.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
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
                  ? Image.asset(ic_logo_light, height: 15, fit: BoxFit.cover)
                  : Image.asset(ic_logo, height: 15, fit: BoxFit.cover))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign up", style: primaryTextStyle(size: 35)),
                  SizedBox(height: 30),
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
                  SizedBox(height: 20),
                  AppTextField(
                      controller: userNameCont,
                      textFieldType: TextFieldType.OTHER,
                      decoration: InputDecoration(
                          labelText: "Username*",
                          labelStyle: secondaryTextStyle(),
                          focusedBorder: UnderlineInputBorder())),
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
            appButton(context, 'Continue', onTap: () {
              hideKeyboard(context);
              //register();
              if (firstNameCont.text.isEmpty) {
                toast("Please enter firstname");
              } else if (lastNameCont.text.isEmpty) {
                toast("Please enter lastname");
              } else if (emailCont.text.isEmpty) {
                toast("Please enter email");
              } else if (userNameCont.text.isEmpty) {
                toast("Please enter username");
              } else if (passCont.text.isEmpty) {
                toast("Please enter password");
              } else {
                registerUsingEmailPassword(emailCont.text, passCont.text);
              }
            }),
          ],
        ),
      ),
    );
  }

  void registerUsingEmailPassword(String email, String password) async {
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
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/$userId");
    await ref.set({
      "firstname": firstNameCont.text,
      "lastname": lastNameCont.text,
      "email": emailCont.text,
      "username": userNameCont.text,
      "password": passCont.text,
      "profile":
          "https://findmycofounders.com//wp-content//plugins//socialv-api////assets//images//default-avatar.jpg",
    }).whenComplete(() {
      toast("Register successfully");
      signInUsingEmailPassword(emailCont.text, passCont.text);
    });
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
      readDataFromUserTable(user!);
    } on FirebaseAuthException catch (e) {
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

  void readDataFromUserTable(User user) {
    String userId = user.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref('users/$userId');
    ref.onValue.listen((DatabaseEvent event) {
      print("User Data:" + event.snapshot.value.toString());
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      prefs.setString(SharePreferencesKey.USERID, checkNullValue(user.uid));
      prefs.setString(
          SharePreferencesKey.FIRSTNAME, checkNullValue(map['firstname']));
      prefs.setString(
          SharePreferencesKey.LASTNAME, checkNullValue(map['lastname']));
      prefs.setString(SharePreferencesKey.EMAIL, checkNullValue(map['email']));
      prefs.setString(
          SharePreferencesKey.USERNAME, checkNullValue(map['username']));
      prefs.setString(
          SharePreferencesKey.PROFILE, checkNullValue(map['profile']));

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
            return DashboardScreen();
          }));

    });
  }

/*void register() async {
    hideKeyboard(context);

    appStore.setLoading(true);

    Map request = {
      "user_login": userNameCont.text,
      "user_name": firstNameCont.text + " " + lastNameCont.text,
      "user_email": emailCont.text,
      "password": passCont.text,
    };

    await createUser(request).then((value) async {
      Map request = {
        Users.username: emailCont.text,
        Users.password: passCont.text,
      };

      await loginUser(request: request, isSocialLogin: false)
          .then((value) async {
        Map req = {
          "player_id": getStringAsync(SharePreferencesKey.ONE_SIGNAL_PLAYER_ID),
          "add": 1
        };

        await setPlayerId(req).then((value) {
          //
        }).catchError((e) {
          log("Player id error : ${e.toString()}");
        });

        //appStore.setPassword(passCont.text);
        //getMemberById();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return DashboardScreen();
        }));
      }).catchError((e) {
        appStore.setLoading(false);
        toast(e.toString());
      });
    }).catchError((e) {
      appStore.setLoading(false);
      String errorResponseMessage = '';
      if (e is String) {
        errorResponseMessage = e;
      } else {
        e.forEach((data) {
          errorResponseMessage = errorResponseMessage + data;
        });
      }
      toast(errorResponseMessage);
    });
  }*/
}
