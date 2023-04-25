import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:link_people/main.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/decorations.dart';

import '../components/JobListComponent.dart';
import '../utils/Extensions/text_styles.dart';

class JobsScreen extends StatefulWidget {
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
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
      body: Observer(builder: (context) {
        return appStore.isJobShowAll == true
            ? SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(12),
                  color: context.scaffoldBackgroundColor,
                  child: jobList(() {
                    setState(() {});
                  }),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(bottom: 8),
                      color: context.scaffoldBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recommended for you", style: boldTextStyle()),
                          SizedBox(height: 24),
                          jobList(() {
                            setState(() {});
                          }),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              appStore.setJobShowAll(true);
                              setState(() {});
                            },
                            child: Container(
                              height: 33,
                              width: context.width(),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: context.scaffoldBackgroundColor,
                                  borderRadius: radius(20),
                                  border: Border.all(width: 0.8)),
                              child: Text('Show all',
                                  style: boldTextStyle(
                                      color: textSecondaryColorGlobal)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      color: context.scaffoldBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("More for you", style: boldTextStyle()),
                          SizedBox(height: 24),
                          jobList(() {
                            setState(() {});
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
