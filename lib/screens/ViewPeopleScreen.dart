import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import '../components/ViewPeopleComponent.dart';
import '../utils/AppDataProvider.dart';
import '../utils/Extensions/text_styles.dart';

class ViewPeopleScreen extends StatefulWidget {
  @override
  _ViewPeopleScreenState createState() => _ViewPeopleScreenState();
}

class _ViewPeopleScreenState extends State<ViewPeopleScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: PreferredSize(
        preferredSize: Size(context.width(), 40),
        child: AppBar(
          backgroundColor: Colors.black38,
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              finish(context);
            },
          ),
          titleSpacing: 0,
          title: Text("People you may know", style: primaryTextStyle(color: Colors.white)),
        ),
      ),
      body: CarouselSlider.builder(
        itemCount: invitationUsers.length,
        itemBuilder: (BuildContext context, int index, int pageViewIndex) => ViewPeopleComponent(
            image: invitationUsers[index].imageUrl.toString(),
            name: invitationUsers[index].name.toString(),
            profession: invitationUsers[index].profession.toString(),
            mutual: invitationUsers[index].mutualFriends!.toInt(),
            isFull: true),
        options: CarouselOptions(autoPlay: false, reverse: false, enableInfiniteScroll: false, initialPage: 1, aspectRatio: 16 / 9, viewportFraction: 0.88, height: context.height()),
      ),
    );
  }
}
