import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';

import '../utils/Extensions/text_styles.dart';

class SelectAnOptionScreen extends StatefulWidget {
  @override
  _SelectAnOptionScreenState createState() => _SelectAnOptionScreenState();
}

class _SelectAnOptionScreenState extends State<SelectAnOptionScreen> {
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
      appBar: AppBar(
        backgroundColor: context.scaffoldBackgroundColor,
        elevation: 1.5,
        iconTheme: IconThemeData(color: context.iconColor),
        automaticallyImplyLeading: true,
        titleTextStyle: boldTextStyle(size: 18),
        title: Text('Select an option', style: boldTextStyle()),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          data('Welcome to the Team', 'Celebrate a new colleague joining your team'),
          data('Give Kudos', 'Show appreciation to your colleague'),
          data('Project launch', 'Shar a new project milestone'),
          data('Work anniversary', 'Celebrate a career milestone'),
          data('New Position', 'Share a job update'),
        ],
      ),
    );
  }

  data(text, subtext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: primaryTextStyle()),
              Text(subtext, style: secondaryTextStyle(size: 12)),
            ],
          ),
        ),
        Divider(thickness: 3)
      ],
    );
  }
}
