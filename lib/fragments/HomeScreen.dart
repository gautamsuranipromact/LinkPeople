import 'package:flutter/material.dart';
import '../components/TimeLineList.dart';
import '../models/TimeLinePostModel.dart';
import '../utils/AppDataProvider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: ListView.separated(
        itemCount: timeLineList.length,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(thickness: 5);
        },
        itemBuilder: (BuildContext context, int index) {
          TimelinePost post = timeLineList[index];
          return TimeLinePostBox(post, isShare: true);
        },
      ),
    );
  }
}
