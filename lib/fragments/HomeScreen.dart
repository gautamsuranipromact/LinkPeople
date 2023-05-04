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
  List<DocumentSnapshot> documentList = [];

  int mPage = 1;
  int mPageSize = 4;
  bool mIsLastPage = false;
  bool isError = false;

  final ScrollController controller = ScrollController();

  bool isAPIRunning = false;
  bool isPaginationAPIRunning = false;

  @override
  void initState() {
    //future = getPostList();
    readDataFromPostsTable();

    _animationController = BottomSheet.createAnimationController(this);
    _animationController.duration = const Duration(milliseconds: 500);
    _animationController.drive(CurveTween(curve: Curves.easeOutQuad));

    super.initState();

    eventBus.on<PostAppEvent>().listen((e) {
      mPage = 1;
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
            readDataFromPostsTable();
          }
        }
      }
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
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  ListView.separated(
                    itemCount: postList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(thickness: 5);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      //TimelinePost post = timeLineList[index];
                      PostModel post = postList[index];
                      return TimeLinePostBox(post, isShare: true);
                    },
                  ),
                  !mIsLastPage
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Loading more..  "),
                                SizedBox(
                                    child: CircularProgressIndicator(),
                                    height: 20,
                                    width: 20),
                              ],
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
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
    print("Pagination: " + mPage.toString());
    if (mPage == 1) {
      postList.clear();
      setState(() {
        isAPIRunning = true;
      });
    } else {
      setState(() {
        isPaginationAPIRunning = true;
      });
    }

    Query<Map<String, dynamic>> _posts;
    if (mPage == 1) {
      _posts = FirebaseFirestore.instance
          .collection('posts')
          .orderBy("timestamp", descending: true)
          .limit(mPageSize);
    } else {
      _posts = FirebaseFirestore.instance
          .collection('posts')
          .orderBy("timestamp", descending: true)
          .startAfterDocument(documentList[documentList.length - 1])
          .limit(mPageSize);
    }

    QuerySnapshot querySnapshot = await _posts.get();

    documentList.addAll(querySnapshot.docs);

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    if (allData.length != mPageSize) {
      mIsLastPage = true;
    }

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
      isPaginationAPIRunning = false;
    });
  }

  checkNullValue(value) {
    return value == null ? "" : value;
  }
}
