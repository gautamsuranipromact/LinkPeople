import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/AppCommon.dart';
import '../utils/Extensions/Commons.dart';
import '../utils/Extensions/Constants.dart';

class CommunicationsScreen extends StatefulWidget {
  @override
  _CommunicationsScreenState createState() => _CommunicationsScreenState();
}

class _CommunicationsScreenState extends State<CommunicationsScreen> {
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
        "Communications",
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
          component(context, "How you get your notifications", "Controls to make sure you only get notified about what's important to you",
              color: context.dividerColor, size: 20, subSize: 16, textColor: textPrimaryColorGlobal, isIcon: false),
          component(context, "On LinkPeople", "Received via LinkPeople web and app"),
          component(context, "Email", 'Received via your primary email'),
          component(context, "Who can reach you", "Manage who you'd like get communications from",
              color: context.dividerColor, size: 20, subSize: 16, textColor: textPrimaryColorGlobal, isIcon: false),
          component(context, "Invitations to connect", "Choose who can connect with you"),
          component(context, "Invitations from you network", "Choose what invitations you'd like to receive from your network"),
          component(context, "Messages", "Allow select people to message you"),
          component(context, "Research invites", "Choose if you want to get invite to get from LinkPeople to participate in research"),
          component(context, "Who can reach you", "Manage who you'd like get communications from",
              color: context.dividerColor, size: 20, subSize: 16, textColor: textPrimaryColorGlobal, isIcon: false),
          component(context, "Read receipts and trying indicators", 'Turn on read receipts and trying indicators'),
          component(context, "Messaging suggestions", "Choose if you want suggestions when messaging"),
          component(context, "Message nudges", "Choose if you want to receive reminders about messages you haven't responded"),
        ],
      ),
    );
  }
}
