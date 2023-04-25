import 'package:flutter/material.dart';
import 'package:link_people/utils/AppCommon.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../utils/AppDataProvider.dart';

class ManageMyNetworkScreen extends StatefulWidget {
  @override
  _ManageMyNetworkScreenState createState() => _ManageMyNetworkScreenState();
}

class _ManageMyNetworkScreenState extends State<ManageMyNetworkScreen> {
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
      appBar: appBarCommon(context, "Manage my network", () {
        finish(context);
      }),
      body: ListView.separated(
        itemCount: networksList.length,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return Visibility(
              visible: index != networksList.length - 1,
              child: Divider(thickness: 1, height: 5));
        },
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (networksList[index].screen != null)
                networksList[index].screen!.launch(context);
            },
            child: Padding(
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, right: 12, left: 12),
              child: Row(
                children: [
                  Icon(networksList[index].image, size: 20),
                  SizedBox(width: 15),
                  Text(networksList[index].name.toString(),
                      style: primaryTextStyle()),
                  Spacer(),
                  Text(networksList[index].total.toString(),
                      style: primaryTextStyle())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
