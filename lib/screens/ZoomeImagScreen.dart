import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:photo_view/photo_view.dart';

import '../utils/Extensions/Commons.dart';

class ZoomImageScreen extends StatefulWidget {
  final String? image;

  ZoomImageScreen(this.image);

  @override
  _ZoomImageScreenState createState() => _ZoomImageScreenState();
}

class _ZoomImageScreenState extends State<ZoomImageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          PhotoView(imageProvider: Image.asset(widget.image!).image),
          IconButton(iconSize: 20, padding: EdgeInsets.zero, icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: () => finish(context)).paddingOnly(top: context.statusBarHeight + 20),
        ],
      ),
    );
  }
}
