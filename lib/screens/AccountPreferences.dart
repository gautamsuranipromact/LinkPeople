import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

class AccountPreferences extends StatefulWidget {
  @override
  _AccountPreferencesState createState() => _AccountPreferencesState();
}

class _AccountPreferencesState extends State<AccountPreferences> {
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
        "Account preferences",
        () {
          finish(context);
        },
        action: [
          IconButton(
            onPressed: () {},
            icon: Icon(AntDesign.questioncircle, color: context.iconColor),
          ),
        ],
      ),
      body: ListView(
        children: [
          component(context, "Profile information",
              'Basic information Associated with your profile',
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Name,location,and industry",
              'Choose how your name and profile field appear to other members '),
          // component(context, "Display", 'Control how linked looks when using this device', color: context.dividerColor, size: 20, subSize: 16, textColor: textPrimaryColorGlobal, isIcon: false),
          component(context, "Dark mode",
              'Choose to use your device settings or select between dark mord and light mod'),
          component(
              context, "Site preferences", 'Manage your LinkPeople experience',
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Language", 'Select the language'),
          component(context, "Content language",
              'Select a language for translation '),
          component(context, "Autoplay video",
              'Choose to autoplay videos on LinkPeople '),
          component(context, "showing profile photos",
              'choose to show or hide profile photos of other members'),
          component(context, "Feed preferences", 'Customize your feed'),
          component(context, "People also viewed",
              'choose if this feature appears to people on your profile'),
          component(context, "Open web link in app",
              'choose if this feature appears to people on your profile'),
          component(context, "Syncing options",
              'Use Information opens third party web links',
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Sync calendar",
              "Manage or sync calendar to get timely updates about who you'll meeting with"),
          component(context, "Sync contacts",
              'Manage or sync contact to connect with people you know directly from address book'),
          component(context, "Subscriptions & payments",
              'Keep track of purchases and subscription status',
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Upgrade for Free",
              "Services you've connected to your LinkPeople account"),
          component(context, "View purchase history",
              "See your previous purchases and translations on LinkPeople"),
          component(context, "Account management",
              "Service you've connected your LinkPeople account",
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, 'Microsoft',
              "View Microsoft account you've connected to your LinkPeople account"),
          component(context, "Twitter setting",
              "Manage Twitter in for on your LinkPeople account"),
          component(
              context, "Account management", "Control your LinkPeople account",
              color: context.dividerColor,
              size: 20,
              subSize: 16,
              textColor: textPrimaryColorGlobal,
              isIcon: false),
          component(context, "Merge account",
              "Transfer connection from a duplicate from duplicate account, then close it"),
          component(context, "Twitter setting",
              "Manage Twitter in for on your LinkPeople account"),
          component(context, "Hibernate account",
              "Temporarily deactivate your account"),
          component(context, "Close account",
              "Learn about your options,and close your account if you wish"),
        ],
      ),
    );
  }
}
