import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:link_people/fragments/HomeScreen.dart';
import 'package:link_people/fragments/PostScreen.dart';
import 'package:link_people/screens/SkillAssessmentsScreen.dart';
import 'package:link_people/screens/WalkThroughScreen.dart';
import 'package:link_people/utils/Extensions/Commons.dart';
import 'package:link_people/utils/Extensions/Constants.dart';
import 'package:link_people/utils/Extensions/Widget_extensions.dart';
import 'package:link_people/utils/Extensions/context_extensions.dart';
import 'package:link_people/utils/Extensions/text_styles.dart';

import '../components/DrawerComponent.dart';
import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/AppCommon.dart';
import '../utils/AppConstants.dart';
import '../utils/AppImages.dart';
import '../utils/Extensions/decorations.dart';
import 'AppSettingScreen.dart';
import 'CreateAJobScreen.dart';
import 'InterviewPrepareScreen.dart';
import 'JobAlertScreen.dart';
import 'MyJobsSrceen.dart';

int selectedIndex = 0;

class DashboardScreen extends StatefulWidget {
  String? userId;

  DashboardScreen({this.userId});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  List<Widget> widgets = [];
  int currentIndex = 0;
  int preIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    widgets.add(HomeScreen());
    //widgets.add(Container(child: Text("Coming Soon...")));
    /*widgets.add(MyNetworkScreen());*/
    widgets.add(PostScreen());
    //widgets.add(Container(child: Text("Coming Soon...")));
    //widgets.add(NotificationScreen());
    //widgets.add(Container(child: Text("Coming Soon...")));
    //widgets.add(JobsScreen());
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        key: globalKey,
        appBar: appStore.isJobShowAll == true
            ? appBarCommon(context, "Recommended for you", () {
                appStore.setJobShowAll(false);
                setState(() {});
              })
            : PreferredSize(
                preferredSize: Size(context.width(), 50.0),
                child: Visibility(
                  visible: currentIndex == 2 ? false : true,
                  child: AppBar(
                    backgroundColor: context.scaffoldBackgroundColor,
                    elevation: 0,
                    leading: prefs
                            .getString(SharePreferencesKey.PROFILE)!
                            .isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.all(8),
                            child: GestureDetector(
                                onTap: () {
                                  globalKey.currentState!.openDrawer();
                                },
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        prefs.getString(
                                            SharePreferencesKey.PROFILE)!),
                                    maxRadius: 30,
                                    minRadius: 20,
                                    backgroundColor: context.cardColor)),
                          )
                        : Padding(
                            padding: EdgeInsets.all(8),
                            child: GestureDetector(
                                onTap: () {
                                  globalKey.currentState!.openDrawer();
                                },
                                child: CircleAvatar(
                                    backgroundImage: AssetImage(ic_placeHolder),
                                    maxRadius: 30,
                                    minRadius: 20,
                                    backgroundColor: context.cardColor)),
                          ),
                    titleSpacing: 0,
                    title: GestureDetector(
                      onTap: () {
                        //SearchScreen().launch(context);
                      },
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(ic_logo, height: 30),
                      )) /*Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor.withOpacity(0.09)),
                        height: 35,
                        padding: EdgeInsets.only(left: 10),
                        width: context.width(),
                        child: Row(
                          children: [
                            Icon(FontAwesome.search,
                                color: textSecondaryColorGlobal, size: 15),
                            SizedBox(width: 5),
                            Text("Search", style: secondaryTextStyle()),
                          ],
                        ),
                      )*/
                      ,
                    ),
                    actions: [
                      Visibility(
                          visible: currentIndex == 4 ? true : false,
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25)),
                                    ),
                                    builder: (_) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            right: 24,
                                            left: 24,
                                            top: 20,
                                            bottom: 16),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: radiusCircular(16),
                                              topRight: radiusCircular(16)),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 5,
                                              width: 50,
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              decoration: BoxDecoration(
                                                  borderRadius: radius(),
                                                  color: grey2),
                                            ),
                                            bottomSheetComponent(
                                                Ionicons.bookmark, "My Jobs",
                                                () {
                                              MyJobsScreen().launch(context,
                                                  pageRouteAnimation:
                                                      PageRouteAnimation.Slide);
                                            }),
                                            bottomSheetComponent(
                                                FontAwesome.bell, "Job alerts",
                                                () {
                                              JobAlertScreen().launch(context);
                                            }),
                                            bottomSheetComponent(
                                                MaterialCommunityIcons
                                                    .sticker_check,
                                                "Skill assessments", () {
                                              SkillAssessmentsScreen()
                                                  .launch(context);
                                            }),
                                            bottomSheetComponent(
                                                Ionicons.ios_document_text,
                                                "Interview prep", () {
                                              InterviewPrepareScreen()
                                                  .launch(context);
                                            }),
                                            bottomSheetComponent(
                                                MaterialCommunityIcons
                                                    .square_edit_outline,
                                                "Post a job", () {
                                              CreateAJobScreen().launch(context,
                                                  pageRouteAnimation:
                                                      PageRouteAnimation
                                                          .SlideBottomTop);
                                            }),
                                            bottomSheetComponent(
                                                Ionicons.settings_sharp,
                                                "Application settings", () {
                                              AppSettingScreen()
                                                  .launch(context);
                                            }),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(MaterialCommunityIcons.dots_vertical,
                                  color: grey2))),
                      InkWell(
                        onTap: () {
                          prefs.setString(SharePreferencesKey.USERID, "");
                          prefs.setString(SharePreferencesKey.FIRSTNAME, "");
                          prefs.setString(SharePreferencesKey.LASTNAME, "");
                          prefs.setString(SharePreferencesKey.EMAIL, "");
                          prefs.setString(SharePreferencesKey.USERNAME, "");
                          prefs.setString(SharePreferencesKey.PROFILE, "");
                          finish(context);

                          WalkThroughScreen().launch(context,
                              pageRouteAnimation: PageRouteAnimation.Scale,
                              isNewTask: true);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            ic_logout,
                            height: 16,
                            width: 16,
                          ),
                        ),
                      ),
/*                      IconButton(
                          onPressed: () {

                            MessageScreen().launch(context,
                                pageRouteAnimation: PageRouteAnimation.Slide);

                          },
                          icon: Icon(ic_logout, color: grey2))*/
                    ],
                  ),
                ),
              ),
        body: IndexedStack(
          children: widgets,
          index: currentIndex,
        ),
        bottomNavigationBar: CustomLineIndicatorBottomNavbar(
          onTap: (i) async {
            preIndex = currentIndex;
            currentIndex = i;
            setState(() {});
            if (currentIndex == 1) {
              bool res = await showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isScrollControlled: true,
                  builder: (c) {
                    return Padding(
                      padding: EdgeInsets.only(top: context.statusBarHeight),
                      child: PostScreen(),
                    );
                  });
              if (res == true) {
                log(preIndex.toString());
                currentIndex = preIndex;
                setState(() {});
              }
            }
          },
          currentIndex: currentIndex,
          backgroundColor: context.scaffoldBackgroundColor,
          indicatorType: IndicatorType.Top,
          unSelectedColor: grey2.withOpacity(0.8),
          selectedIconSize: 22,
          unselectedIconSize: 22,
          selectedColor: appStore.isDarkMode ? Colors.white : Colors.black,
          customBottomBarItems: [
            CustomBottomBarItems(icon: FontAwesome.home, label: 'Home'),
            /*CustomBottomBarItems(icon: FontAwesome.users, label: 'My Network'),*/
            CustomBottomBarItems(icon: MaterialIcons.add_box, label: 'Post'),
            /*CustomBottomBarItems(
                icon: Ionicons.ios_notifications, label: 'Notifications'),
            CustomBottomBarItems(icon: Icons.work, label: 'Jobs'),*/
          ],
        ),
        drawer: Drawer(
          child: drawerComponent(context, () {
            setState(() {});
          }),
        ),
      );
    });
  }

  bottomSheetComponent(IconData icon, text, Function onTap) {
    return GestureDetector(
      onTap: () {
        finish(context);
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: textSecondaryColorGlobal, size: 22),
            SizedBox(width: 12),
            Text(text,
                style: primaryTextStyle(color: textSecondaryColorGlobal)),
          ],
        ),
      ),
    );
  }
}
