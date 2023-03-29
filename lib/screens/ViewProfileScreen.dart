import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/screens/AccountPreferences.dart';
import 'package:link_people/screens/SearchScreen.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';
import '../components/ExperienceComponent.dart';
import '../components/ProfileBioComponent.dart';
import '../components/ProfileBox.dart';
import '../components/ProfileComponent.dart';
import '../components/SkillListComponent.dart';
import '../utils/AppColors.dart';
import '../utils/AppDataProvider.dart';

class ViewProfileScreen extends StatefulWidget {
  final String? name;
  final String? image;
  final bool? isUser;

  ViewProfileScreen({this.name, this.image, this.isUser = false});

  @override
  _ViewProfileScreenState createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
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
        () {
          finish(context);
        },
        action: [
          IconButton(
            onPressed: () {
              AccountPreferences().launch(context);
            },
            icon: Icon(Icons.settings, color: grey2),
          ),
        ],
        centerWidget: GestureDetector(
          onTap: () {
            SearchScreen(text: widget.name ?? "Muskan Agrawal").launch(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.09),
              borderRadius: BorderRadius.circular(5),
            ),
            height: 40,
            padding: EdgeInsets.all(6),
            width: context.width(),
            child: Row(
              children: [
                Icon(FontAwesome.search, size: 16, color: context.iconColor),
                SizedBox(width: 5),
                Text(widget.name ?? "Muskan Agrawal", style: primaryTextStyle()),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ProfileBox(widget.image, isUser: widget.isUser),
          ProfileBio(widget.name),
          SizedBox(height: 20),
          Visibility(
            visible: widget.isUser == true,
            child: Column(
              children: [
                Divider(thickness: 4, height: 4),
                profileAnalyticBox(pAnalyticList, context, 'Analytics'),
                Divider(height: 4, thickness: 4),
                profileAnalyticBox(resourcesList, context, 'Resources'),
              ],
            ),
          ),
          Divider(height: 4, thickness: 4),
          profileActivityBox(context, isUser: widget.isUser),
          Divider(height: 8, thickness: 8),
          experienceBox(context, isUser: widget.isUser),
          Divider(height: 8, thickness: 8),
          profileEducationBox(context, isUser: widget.isUser),
          Divider(height: 8, thickness: 8),
          skillProfileBox(context, isUser: widget.isUser),
          Divider(height: 8, thickness: 8),
          peopleAlsoView(context, () {
            setState(() {});
          }),
        ],
      ),
    );
  }
}
