import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:link_people/models/post_model.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/TimeLineList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  List<PostModel> postList = [];
  late Future<List<PostModel>> future;

  int mPage = 1;
  bool mIsLastPage = false;
  bool isError = false;

  final ScrollController controller = ScrollController();

  @override
  void initState() {
    //future = getPostList();
    readDataFromPostsTable();

    _animationController = BottomSheet.createAnimationController(this);
    _animationController.duration = const Duration(milliseconds: 500);
    _animationController.drive(CurveTween(curve: Curves.easeOutQuad));

    super.initState();

    //setStatusBarColorBasedOnTheme();

    /*widget.*/
    controller.addListener(() {
      /// pagination
      if (selectedIndex == 0) {
        if (/*widget.*/ controller.position.pixels == /*widget.*/
            controller.position.maxScrollExtent) {
          if (!mIsLastPage) {
            mPage++;
            setState(() {});

            //future = getPostList();
          }
        }
      }
    });

    LiveStream().on(OnAddPost, (p0) {
      postList.clear();
      mPage = 1;
      //future = getPostList();
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: postList.length,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(thickness: 5);
        },
        itemBuilder: (BuildContext context, int index) {
          //TimelinePost post = timeLineList[index];
          PostModel post = postList[index];
          return TimeLinePostBox(post, isShare: true);
        },
      ),
    );
  }

  void readDataFromPostsTable() {
    postList.clear();
    DatabaseReference ref = FirebaseDatabase.instance.ref('posts');
    ref.onValue.listen((DatabaseEvent event) {
      print("Posts Data:" + event.snapshot.value.toString());
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      map.forEach((key, value) {
        print("$key: $value");
        postList.add(PostModel(
            content: checkNullValue(value['content']),
            userEmail: checkNullValue(value['email']),
            userImage: checkNullValue(value['profile']),
            userName: checkNullValue(value['firstname']) +
                " " +
                checkNullValue(value['lastname']),
            userId: checkNullValue(value['userid'])));
        setState(() {});
      });
    });
  }

  checkNullValue(value) {
    return value == null ? "" : value;
  }

/*Future<List<PostModel>> getPostList() async {
    appStore.setLoading(true);
    await getPost(page: mPage, type: PostRequestType.timeline).then((value) {
      if (mPage == 1) postList.clear();

      mIsLastPage = value.length != PER_PAGE;
      postList.addAll(value);
      setState(() {});

      appStore.setLoading(false);
    }).catchError((e) {
      isError = true;
      appStore.setLoading(false);
      toast(e.toString(), print: true);

      setState(() {});
    });

    return postList;
  }*/
}
