import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_people/components/TimeLineList.dart';
import 'package:link_people/main.dart';
import 'package:link_people/models/AppEvent.dart';
import 'package:link_people/models/post_model.dart';
import 'package:link_people/screens/DashboardScreen.dart';
import 'package:link_people/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

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

  bool isAPIRunning = false;

  @override
  void initState() {
    //future = getPostList();
    readDataFromPostsTable();

    _animationController = BottomSheet.createAnimationController(this);
    _animationController.duration = const Duration(milliseconds: 500);
    _animationController.drive(CurveTween(curve: Curves.easeOutQuad));

    super.initState();

    eventBus.on<PostAppEvent>().listen((e) {
      readDataFromPostsTable();
    });

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
      body: Stack(
        children: [
          Visibility(
            visible: !isAPIRunning,
            child: ListView.separated(
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
          ),
          Visibility(
              visible: isAPIRunning,
              child: Center(
                child: CircularProgressIndicator(),
              ))
        ],
      ),
    );
  }

  void readDataFromPostsTable() async {
    setState(() {
      isAPIRunning = true;
    });

    Query<Map<String, dynamic>> _posts =
        FirebaseFirestore.instance.collection('posts').orderBy("timestamp",descending: true);

    QuerySnapshot querySnapshot = await _posts.get();

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);

    postList.clear();

    for (int i = 0; i < allData.length; i++) {
      dynamic post = allData.elementAt(i);
      String userId = post["userid"];

      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      DocumentSnapshot snapshot = await users.doc(userId).get();
      Map<String, dynamic> userMap = snapshot.data() as Map<String, dynamic>;

      String userType = userMap['type'];
      String lookingFor = userMap['lookingFor'];
      String time = checkNullValue(post['postTime']);
      DateTime parsedDate = DateTime.parse(time);
      List<Object?> imageMediaObject = [];
      if (post['images'] != null) {
        imageMediaObject = post['images'];
      }
      List<String> imageMediaList = [];
      for (int i = 0; i < imageMediaObject.length; i++) {
        imageMediaList.add(imageMediaObject.elementAt(i).toString());
      }
      bool isLiked = false;
      String likeId = "";
      try {
        Query<Map<String, dynamic>> postLikes = FirebaseFirestore.instance
            .collection('postLikes')
            .where("searchText",
                isEqualTo: prefs.getString(SharePreferencesKey.USERID)! +
                    "" +
                    post['postId'] +
                    "true");
        QuerySnapshot<Map<String, dynamic>> postLikesSnapshot =
            await postLikes.get();

        for (var doc in postLikesSnapshot.docs) {
          likeId = doc.get('likeId');
          isLiked = true;
        }
      } catch (e) {
        print(e);
      }

      postList.add(PostModel(
          postId: post['postId'],
          content: checkNullValue(post['content']),
          userEmail: checkNullValue(userMap['email']),
          userImage: checkNullValue(userMap['profile']),
          userName: checkNullValue(userMap['firstname']) +
              " " +
              checkNullValue(userMap['lastname']),
          userId: checkNullValue(userId),
          subContent: "I am a " + userType + " and Looking for " + lookingFor,
          dateRecorded: parsedDate.timeAgo,
          likeCount: post['like'],
          commentCount: post['comment'],
          imageMediaList: imageMediaList,
          isLiked: isLiked,
          likeId: likeId,
          timestamp: post['timestamp']));
    }

    setState(() {
      isAPIRunning = false;
    });
  }

  checkNullValue(value) {
    return value == null ? "" : value;
  }
}
