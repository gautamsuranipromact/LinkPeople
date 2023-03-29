import 'package:flutter/material.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import '../components/EditEducationComponet.dart';
import '../components/EditExperienceComponent.dart';
import '../utils/AppColors.dart';
import '../utils/Extensions/decorations.dart';
import '../utils/Extensions/text_styles.dart';

class AddOrEditEducationScreen extends StatefulWidget {
  final bool? isExperience;

  AddOrEditEducationScreen({this.isExperience = false});

  @override
  _AddOrEditEducationScreenState createState() => _AddOrEditEducationScreenState();
}

class _AddOrEditEducationScreenState extends State<AddOrEditEducationScreen> {
  bool isAlert = false;

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCommon(
          context,
          "",
          () {},
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.close)),
        ),
        body: widget.isExperience == true ? EditExperienceComponent() : EditEducationComponent(),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          width: context.width(),
          height: 35,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(color: primaryColor, borderRadius: radius(30)),
          child: Text("Save", style: boldTextStyle(color: Colors.white)),
        ));
  }
}
