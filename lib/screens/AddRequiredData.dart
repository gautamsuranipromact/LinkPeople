import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_people/screens/AddMoreUserInfo.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/AppImages.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../main.dart';
import '../utils/AppConstants.dart';

class AddRequiredData extends StatefulWidget {
  @override
  _AddRequiredDataState createState() => _AddRequiredDataState();
}

class _AddRequiredDataState extends State<AddRequiredData> {
  String selectedUserType = 'Founder';
  String selectedLookingFor = 'Mentor';

  bool isAPIRunning = false;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select who you are and Looking for", style: primaryTextStyle(size: 35)),
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
                  SizedBox(height: 24),
                ],
              ),
            ),
            isAPIRunning
                ? CircularProgressIndicator()
                : appButton(context, 'Continue', onTap: () {
                    hideKeyboard(context);
                    registerUsingEmailPassword();
                  }),
          ],
        ),
      ),
    );
  }

  void registerUsingEmailPassword() async {
    setState(() {
      isAPIRunning = true;
    });
    try {
      String userId = prefs.getString(SharePreferencesKey.USERID)!;

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      users.doc(userId).update({
        "type": selectedUserType,
        "lookingFor": selectedLookingFor,
      }).whenComplete(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return AddMoreUserInfo();
        }));
      }).catchError((error) {
        setState(() {
          isAPIRunning = false;
        });
        print("Failed to add user: $error");
      });
    } catch (e) {
      setState(() {
        isAPIRunning = false;
      });
      print(e);
      toast(e.toString());
    }
  }
}
