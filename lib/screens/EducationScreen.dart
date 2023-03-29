import 'package:flutter/material.dart';
import 'package:link_people/screens/AddOrEditEducationScreen.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import '../components/EducationComponent.dart';
import '../components/ExperienceComponent.dart';
import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';

class EducationScreen extends StatefulWidget {
  final bool? isExperience;

  EducationScreen({this.isExperience = false});

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
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
        backgroundColor: context.dividerColor,
        appBar: appBarCommon(context, widget.isExperience == true ? "Experience" : "Education", () {
          finish(context);
        }, action: [
          IconButton(
              onPressed: () {
                AddOrEditEducationScreen().launch(context);
              },
              icon: Icon(Icons.add))
        ]),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: context.scaffoldBackgroundColor,
            child: widget.isExperience == true ? experienceComponent(context, isEdit: true) : educationComponent(isEdit: true)));
  }
}
