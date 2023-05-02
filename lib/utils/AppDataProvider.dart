import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../models/AnwserModel.dart';
import '../models/EducationModel.dart';
import '../models/InvitationUsersModel.dart';
import '../models/JobModel.dart';
import '../models/NetworkModel.dart';
import '../models/NewsModel.dart';
import '../models/NotificationModel.dart';
import '../models/PagesModel.dart';
import '../models/ProfileAnalyticModel.dart';
import '../models/ProfileExperinceModel.dart';
import '../models/SkillModel.dart';
import '../models/TimeLinePostModel.dart';
import '../models/WalkThroughModel.dart';
import '../screens/ConnectionsScreen.dart';
import '../screens/HashTagScreen.dart';
import 'AppImages.dart';

List<WalkThroughModel> walkThroughClass = [
  WalkThroughModel(
      text: "Find and land your next job",
      name: "Mighty link_people",
      img: ic_walk1),
  WalkThroughModel(
      text: "build your network on the go",
      name: "Choose Topics",
      img: ic_walk2),
  WalkThroughModel(
      text: "stay ahead with curated content for your career",
      name: "Save your post",
      img: ic_walk3)
];

List<TimelinePost> timeLineList = [
  TimelinePost(
      name: "Adam Grant",
      profession: "Graphic Designer",
      image: ic_timeLine1,
      likedByUser: "Muskan Agarwal",
      description:
          "It's not your job to fix a toxic workplace from the bottom If leaders at the top aren't committed to change, the best way to stay sane is to shield yourself and support your team .Your responsibility is to protect your well-being, your career, and the people you care about.",
      profilePhoto: ic_man1,
      isPostLike: false,
      comments: 12),
  TimelinePost(
      name: "Ledner-Cummerata",
      image: ic_timeLine2,
      profession: "438,734 followers \n Promoted",
      likedByUser: "Muskan Agarwal",
      description:
          "Get a birds-eye view of recent gaming trends with this in depth data breakdown",
      profilePhoto: ic_profile2,
      isPostLike: false,
      comments: 24),
  TimelinePost(
      name: "Prem Aaswani",
      image: ic_timeLine3,
      profession: "Android Developer",
      likedByUser: "Pranjal Sharma",
      description:
          "Happy Chetichand to all . \nMay the glory of Jhulelal Sai bring along peace, harmony , & lots of smiles in your life. \n Jai Jhulelal 🙏🙏",
      profilePhoto: ic_profile,
      isPostLike: false,
      comments: 64),
  TimelinePost(
      name: "Adam Grant",
      profession:
          "Organizational psychologist at Wharton, #1 NYT bestselling author of THINK AGAIN, and host of the TED podcast WorkLife",
      image: ic_timeLine4,
      likedByUser: "Muskan Agarwal",
      description:
          "It's not your job to fix a toxic workplace from the bottom If leaders at the top aren't committed to change, the best way to stay sane is to shield yourself and support your team .Your responsibility is to protect your well-being, your career, and the people you care about.",
      profilePhoto: ic_man2,
      isPostLike: false,
      comments: 4),
  TimelinePost(
      name: "Sara Blakely",
      profession: "Founder of SPANX",
      image: ic_timeLine5,
      likedByUser: "Sonali Bhati",
      description:
          "To all the women and girls out there... never dim your light. The world needs YOU to shine bright. 🌟 👊Tag a woman in your life who inspires you and pass it on... #WomensHistoryMonth #Entrepreneur",
      profilePhoto: ic_woman6,
      isPostLike: false,
      comments: 22),
  TimelinePost(
      name: "Brene Brown",
      image: ic_timeLine6,
      likedByUser: "Sonali Bhati",
      profession:
          "University of Houston + University of Texas at Austin | Researcher. Storyteller. Courage-builder.",
      description:
          "Oh, the power in knowing that pain and sorrow are also part of the path. Susan Cain’s book “Bittersweet” is so healing. Especially now .Join us for Part 2 of this “Unlocking Us” conversation. https://bit.ly/3ractEX",
      profilePhoto: ic_woman5,
      isPostLike: false,
      comments: 12),
  TimelinePost(
      name: "Suze Orman",
      image: ic_timeLine7,
      profession:
          "Bestselling Author | Host of the Women & Money Podcast | Co-Founder of SecureSave",
      likedByUser: "Sonali Bhati",
      description:
          "Celebrate your savings. In the way you get pleasure from buying a new piece of clothing, a new car or whatever, the same should be true when you save money. It’s really that simple, my friends . #savemoney #celebrateyourwins",
      profilePhoto: ic_man4,
      isPostLike: false,
      comments: 8),
];

List<InvitationUsers> invitationUsers = [
  InvitationUsers(
      name: "Vikas Gupta",
      profession: "Junior UI/UX designer",
      mutualFriends: 11,
      imageUrl: ic_man1,
      time: '4 days',
      isFollow: false),
  InvitationUsers(
      name: "Anjali Tiwari",
      profession: "Software Engineer",
      mutualFriends: 1,
      imageUrl: ic_woman1,
      time: '4 days',
      isFollow: false),
  InvitationUsers(
      name: "Shreyansh Gupta",
      profession: "Graphic Designer",
      mutualFriends: 2,
      imageUrl: ic_man4,
      time: '5 days',
      isFollow: false),
  InvitationUsers(
      name: "Niharika Agarwal",
      profession: "Data Scientist",
      mutualFriends: 5,
      imageUrl: ic_woman6,
      time: '6 days',
      isFollow: false),
  InvitationUsers(
      name: "Prashant Jain",
      profession: "Product Manager",
      mutualFriends: 5,
      imageUrl: ic_man7,
      time: '10 days',
      isFollow: false),
  InvitationUsers(
      name: "Nandini Maheswari",
      profession: "Flutter Developer",
      mutualFriends: 4,
      imageUrl: ic_woman7,
      time: '15 days',
      isFollow: false),
  InvitationUsers(
      name: "Harsh Trivedi",
      profession: "UI/UX designer",
      mutualFriends: 2,
      imageUrl: ic_man8,
      time: '20 days',
      isFollow: false),
  InvitationUsers(
      name: "Harshita Mathur",
      profession: "Junior(React) Frontend Developer",
      mutualFriends: 4,
      imageUrl: ic_woman3,
      time: '21 days',
      isFollow: false),
  InvitationUsers(
      name: "Purnima Jain",
      imageUrl: ic_woman2,
      profession: "Android Developer",
      mutualFriends: 7,
      time: '1 month',
      isFollow: false),
  InvitationUsers(
      name: "Agustya Rajpurohit",
      profession: "Engineering Student",
      mutualFriends: 7,
      imageUrl: ic_man5,
      time: '1 month ',
      isFollow: false),
];
List<PagesModel> pagesList = [
  PagesModel(
      name: "Rundofase",
      followers: 2645058,
      image: ic_profile1,
      coverPhoto: ic_cover1),
  PagesModel(
      name: "Ledner-Cummerata",
      followers: 8445058,
      image: ic_profile2,
      coverPhoto: ic_cover2),
  PagesModel(
      name: "Herzog PLC",
      followers: 1645058,
      image: ic_profile3,
      coverPhoto: ic_cover3),
  PagesModel(
      name: "Rundofase",
      followers: 82545058,
      image: ic_profile4,
      coverPhoto: ic_cover4),
  PagesModel(
      name: "Ledner-Cummerata",
      followers: 3845058,
      image: ic_profile5,
      coverPhoto: ic_cover5),
  PagesModel(
      name: "Herzog PLC",
      followers: 2645058,
      image: ic_profile6,
      coverPhoto: ic_cover6),
  PagesModel(
      name: "Rundofase",
      followers: 845058,
      image: ic_profile7,
      coverPhoto: ic_cover7),
  PagesModel(
      name: "Ledner-Cummerata",
      followers: 47445058,
      image: ic_profile8,
      coverPhoto: ic_cover8),
  PagesModel(
      name: "Herzog PLC",
      followers: 2645058,
      image: ic_profile10,
      coverPhoto: ic_cover9),
  PagesModel(
      name: "Ledner-Cummerata",
      followers: 3245058,
      image: ic_profile5,
      coverPhoto: ic_cover10),
];

List<NotificationModel> notificationsList = [
  NotificationModel(
      image: ic_woman6, name: "<b>Akansha Bhadani</b> shared a post"),
  NotificationModel(
      image: ic_profile3,
      name: "Your <b>Job Alert<b> for <b>flutter</b> in <b>Jaipur</b>",
      isJob: true),
  NotificationModel(
      image: ic_profile1,
      name: "Your <b>Job Alert</b> for <b>flutter</b> in <b>India</b>",
      profileView: true),
  NotificationModel(
      image: ic_profile7,
      name: "Your <b>Job Alert</b> for <b>flutter</b> in <b>Mumbai</b>",
      isRead: true,
      isJob: true),
  NotificationModel(
      image: ic_profile10,
      name:
          "Your <b>Job Alert</b> for <b>android Developer</b> in <b>Mumbai</b>",
      isRead: true,
      isJob: true),
  NotificationModel(
      image: ic_view,
      profileView: true,
      name:
          "<b>16 people</b> viewed your profile: Stay anonymous and see who's viewed your profile with Premium",
      isRead: true),
  NotificationModel(
      image: ic_profile2,
      name:
          "Congratulate <b>Sam Parks</b> and 3 others for starting new positions",
      isRead: true,
      isJob: true),
  NotificationModel(
      image: ic_woman6, name: "<b>Akansha Bhadani</b> shared a post"),
  NotificationModel(
      image: ic_profile2,
      name: "Your <b>Job Alert<b> for <b>flutter</b> in <b>Jaipur</b>",
      isJob: true),
  NotificationModel(
      image: ic_profile1,
      name: "Your <b>Job Alert</b> for <b>flutter</b> in <b>India</b>",
      isJob: true,
      isRead: true),
  NotificationModel(
      image: ic_profile8,
      name: "Your <b>Job Alert</b> for <b>flutter</b> in <b>Mumbai</b>",
      isJob: true,
      isRead: true),
  NotificationModel(
      image: ic_profile2,
      name: "Your <b>Job Alert<b> for <b>flutter</b> in <b>Jaipur</b>",
      isJob: true),
  NotificationModel(
      image: ic_profile1,
      name: "Your <b>Job Alert</b> for <b>flutter</b> in <b>India</b>",
      isJob: true,
      isRead: true),
  NotificationModel(
      image: ic_profile8,
      name: "Your <b>Job Alert</b> for <b>flutter</b> in <b>Mumbai</b>",
      isJob: true,
      isRead: true),
  NotificationModel(
      image: ic_profile2,
      name: "Your <b>Job Alert<b> for <b>flutter</b> in <b>Jaipur</b>",
      isJob: true),
  NotificationModel(
      image: ic_profile1,
      name: "Your <b>Job Alert</b> for <b>flutter</b> in <b>India</b>",
      isJob: true,
      isRead: true),
  NotificationModel(
      image: ic_profile8,
      name: "Your <b>Job Alert</b> for <b>flutter</b> in <b>Mumbai</b>",
      isJob: true,
      isRead: true),
];

List<JobsModel> jobsList = [
  JobsModel(
      companyName: "Rundofase",
      companyImage: ic_profile1,
      jobType: "Flutter Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Ledner-Cummerata",
      companyImage: ic_profile2,
      jobType: "Android Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Herzog PLC",
      companyImage: ic_profile3,
      jobType: "Java Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Rundofase",
      companyImage: ic_profile4,
      jobType: "PHP Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Ledner-Cummerata",
      companyImage: ic_profile5,
      jobType: "Android Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Herzog PLC",
      companyImage: ic_profile6,
      jobType: "Android Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Rundofase",
      companyImage: ic_profile10,
      jobType: "Flutter Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Ledner-Cummerata",
      companyImage: ic_profile2,
      jobType: "Android Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Herzog PLC",
      companyImage: ic_profile3,
      jobType: "Java Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Rundofase",
      companyImage: ic_profile4,
      jobType: "PHP Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Ledner-Cummerata",
      companyImage: ic_profile5,
      jobType: "Android Developer",
      isBookMark: false),
  JobsModel(
      companyName: "Herzog PLC",
      companyImage: ic_profile6,
      jobType: "Android Developer",
      isBookMark: false),
];

List<SkillModel> skillList = [
  SkillModel(
      name: "HTML",
      image: ic_skill1,
      subText:
          'Beyond HTML;HTML fundamentals:Images,Sound,and video:tables and Mathematics; Web for all.',
      people: "2.6M"),
  SkillModel(
      name: "Android",
      image: ic_skill2,
      subText:
          'Android system,Application,Troubleshoot and Optimization, User Experience.',
      people: "800K"),
  SkillModel(
      name: "Kotlin",
      image: ic_skill1,
      subText: 'Basics,Classes and Objects,Collections,Control Flow,Functions.',
      people: "89K"),
  SkillModel(
      name: "Front-End Development assessment",
      image: ic_skill2,
      subText:
          'Browser Management,CSS style and Layouts,Frameworks,HTML Fundamentals, JavaScript coding.',
      people: "490K"),
  SkillModel(
      name: "Cascading Style Sheets(CSS)",
      image: ic_skill1,
      subText:
          'Beyond HTML;HTML fundamentals:Images,Sound,and video:tables and Mathematics; Web for all.',
      people: "1.4M"),
  SkillModel(
      name: "Swift(Programming Language)",
      image: ic_skill2,
      subText:
          'Android system,Application,Troubleshoot and Optimization, User Experience.',
      people: "162K"),
  SkillModel(
      name: "Search Engine Optimization(SEO)",
      image: ic_skill1,
      subText: 'Basics,Classes and Objects,Collections,Control Flow,Functions.',
      people: "1.5M"),
  SkillModel(
      name: "WordPress",
      image: ic_skill2,
      subText:
          'Browser Management,CSS style and Layouts,Frameworks,HTML Fundamentals, JavaScript coding.',
      people: "928K"),
];

List<NewsModel> newsList = [
  NewsModel(
      name: "Musk hints at 'Plans B' for Twitter",
      img: ic_timeLine1,
      subtext:
          'Beyond HTML;HTML fundamentals:Images,Sound,and video:tables and Mathematics; Web for all.'),
  NewsModel(
      name: "Applying for Fresher roles? watch this",
      img: ic_timeLine2,
      subtext:
          'Android system,Application,Troubleshoot and Optimization, User Experience.'),
  NewsModel(
      name: "Meesho lays off 150 employees",
      img: ic_timeLine3,
      subtext:
          'Basics,Classes and Objects,Collections,Control Flow,Functions.'),
  NewsModel(
      name: "The 25 top companies in india",
      img: ic_timeLine4,
      subtext:
          'Browser Management,CSS style and Layouts,Frameworks,HTML Fundamentals, JavaScript coding.'),
  NewsModel(
      name: "BCom or BSc? How about both",
      img: ic_timeLine5,
      subtext:
          'Beyond HTML;HTML fundamentals:Images,Sound,and video:tables and Mathematics; Web for all.'),
  NewsModel(
      name: "The hot startup sector of 2022",
      img: ic_timeLine6,
      subtext:
          'Android system,Application,Troubleshoot and Optimization, User Experience.'),
  NewsModel(
      name: "Attrition to rise at india inc",
      img: ic_timeLine7,
      subtext:
          'Basics,Classes and Objects,Collections,Control Flow,Functions.'),
  NewsModel(
      name: "what to do with a bonus or pay hike",
      img: ic_timeLine8,
      subtext:
          'Browser Management,CSS style and Layouts,Frameworks,HTML Fundamentals, JavaScript coding.'),
];

List<ProfileExperienceModel> experienceList = [
  ProfileExperienceModel(
      name: "Freelance Developer",
      image: ic_freelance,
      time: "Jan 2021 - Present · 1 yr 4 mos",
      description: "Freelance, self-employed · Full-time"),
  ProfileExperienceModel(
      name: "Freelance",
      image: ic_profile5,
      time: "Oct 2020 - Present · 1 yr 7 mos",
      description: "nata · Full-time"),
];

List<ProfileAnalyticModel> pAnalyticList = [
  ProfileAnalyticModel(
      name: "122 profile views",
      icon: Icons.people,
      description: "Discover who's viewed your profile"),
  ProfileAnalyticModel(
      name: "2,003 post views",
      icon: Icons.leaderboard,
      description: "Check out who's engaging with your posts"),
  ProfileAnalyticModel(
      name: "129 search appearances",
      icon: Icons.search,
      description: "See how often you appear in search results."),
];

List<ProfileAnalyticModel> resourcesList = [
  ProfileAnalyticModel(
      name: "Creator mode",
      icon: Icons.cell_tower,
      description:
          "Get discovered, showcase content on your profile, and get access to creator tools"),
  ProfileAnalyticModel(
      name: "My Network",
      icon: Icons.people,
      description: "See and manage your connections and interests"),
];

List<WalkThroughModel> expertList = [
  WalkThroughModel(
      text:
          "First time filling a tak return for my LLC, can anyone recommend a tax professional who can help me?",
      img: ic_man1),
  WalkThroughModel(
      text:
          "Building my new website,can anyone recommend a designer they've worked with before? ",
      img: ic_woman1),
  WalkThroughModel(
      text:
          "Need help setting up some social media campaigs.who know a great social media marketers i can hire?",
      img: ic_woman5)
];

List<WalkThroughModel> interviewQueList = [
  WalkThroughModel(text: "Tell me about yourself.", index: 01, img: ic_man1),
  WalkThroughModel(
      text: "What is your greatest strength?", index: 02, img: ic_woman1),
  WalkThroughModel(
      text: "What is your greatest weakness?", index: 03, img: ic_man2),
  WalkThroughModel(text: "Why should we hire you?", index: 04, img: ic_woman2),
  WalkThroughModel(
      text: "Why do you want to work here?", index: 05, img: ic_man3),
  WalkThroughModel(
      text: "Tell me about a time you showed leadership.",
      index: 06,
      img: ic_woman3),
  WalkThroughModel(
      text: "Tell me about a time you were successful on a team.",
      index: 07,
      img: ic_man4),
  WalkThroughModel(
      text: "What would your co-workers say about you?",
      index: 08,
      img: ic_woman4),
  WalkThroughModel(text: "Tell me about yourself.", index: 09, img: ic_man5),
  WalkThroughModel(
      text: "What is your greatest strength?", index: 10, img: ic_woman5),
  WalkThroughModel(
      text: "What is your greatest weakness?", index: 11, img: ic_man6),
  WalkThroughModel(text: "Why should we hire you?", index: 12, img: ic_woman6),
  WalkThroughModel(
      text: "Why do you want to work here?", index: 13, img: ic_man7),
  WalkThroughModel(
      text: "Tell me about a time you showed leadership.",
      index: 14,
      img: ic_woman7),
  WalkThroughModel(
      text: "Tell me about a time you were successful on a team.",
      index: 15,
      img: ic_man8),
  WalkThroughModel(
      text: "What would your co-workers say about you?",
      index: 16,
      img: ic_woman8),
];

List<AnswerModel> ansList = [
  AnswerModel(
      text:
          "From a very early age I've been a problem solver, 1 was that hid who would take apart anything so I could see how it worked-and then try to put it back together...",
      name: "Sample answer 1",
      subtext: "By Jenny Foss, Career Strategist at Find My CoFounder-corp ",
      view: "3,904,815 views Includes video"),
  AnswerModel(
      text:
          "In my current role as the marketing analyst responsible for a shampoo product line, my core responsibility is to assist the marketing manager to prepare the an...",
      name: "Sample answer 2",
      subtext: "By Marketing & Brand Manager Professional",
      view: "3,015,076 views"),
  AnswerModel(
      text:
          "I would describe myself as highly curious and focused on learning in all parts of life, personal and professional....",
      name: "Sample answer 3",
      subtext: "By Product Manager Professional ",
      view: "2,844,989 views"),
  AnswerModel(
      text:
          "I've been shipping consumer devices for the past two decades. Over the years, I've built an expertise in firmware and bootloader designs....",
      name: "Sample answer 4",
      subtext: "By Mechanical Engineer Professional ",
      view: "2,844,989 views"),
];

List<AnswerModel> categoryList = [
  AnswerModel(text: "Accountant ", subtext: "12 questions"),
  AnswerModel(text: "Account Management ", subtext: "22 questions"),
  AnswerModel(text: "Administrative Assistant ", subtext: "15 questions"),
  AnswerModel(text: "Business Analyst ", subtext: "23 questions"),
  AnswerModel(text: "Common Questions ", subtext: "26 questions"),
  AnswerModel(text: "Corporate Finance ", subtext: "17 questions"),
  AnswerModel(text: "Customer Success ", subtext: "15 questions"),
  AnswerModel(text: "Investment Banking ", subtext: "21 questions"),
  AnswerModel(text: "Marketing Manager ", subtext: "17 questions"),
  AnswerModel(text: "Project Manager ", subtext: "15 questions"),
  AnswerModel(text: "Relationship Management ", subtext: "17 questions"),
  AnswerModel(text: "Sales Development ", subtext: "20 questions"),
  AnswerModel(text: "Software Engineer ", subtext: "22 questions"),
  AnswerModel(text: "Wealth Management ", subtext: "15 questions"),
];

List<NetworkList> networksList = [
  NetworkList(
      name: "Connections",
      image: FontAwesome.group,
      total: 16,
      screen: ConnectionsScreen(false)),
  NetworkList(
      name: "People I follow",
      image: FontAwesome.user,
      total: 9,
      screen: ConnectionsScreen(true)),
  NetworkList(
      name: "Hashtags",
      image: Fontisto.hashtag,
      total: 4,
      screen: HashTagScreen(true)),
  NetworkList(
      name: "Pages",
      image: Entypo.news,
      total: 3,
      screen: HashTagScreen(false)),
];

List<WalkThroughModel> hashTagList = [
  WalkThroughModel(text: "workathome", name: '250,546'),
  WalkThroughModel(text: "android", name: '541,564'),
  WalkThroughModel(text: "networking", name: '55,985'),
  WalkThroughModel(text: "mobiletechnology", name: '878,879'),
  WalkThroughModel(text: "jobinterview", name: '656,546'),
  WalkThroughModel(text: "personaldevlopment", name: '236,778'),
  WalkThroughModel(text: "motivation", name: '585,252'),
  WalkThroughModel(text: "india", name: '757,886'),
  WalkThroughModel(text: "flutter", name: '88,333')
];

List<WalkThroughModel> pageList = [
  WalkThroughModel(text: "Rundofase", img: ic_profile10, name: '250,546'),
  WalkThroughModel(
      text: "Ledner-Cummerata ", img: ic_profile1, name: '541,564'),
  WalkThroughModel(text: "Herzog PLC", img: ic_profile3, name: '55,985'),
  WalkThroughModel(text: "Rundofase", img: ic_profile6, name: '878,879'),
  WalkThroughModel(
      text: "Ledner-Cummerata ", img: ic_profile7, name: '656,546'),
  WalkThroughModel(text: "Herzog PLC", img: ic_profile10, name: '236,778')
];

List<EducationModel> educationList = [
  EducationModel(
      inName: "ABC Group Of Institutions",
      degree: "Bachelor of Engineering",
      field: "Drop Out Computer Science",
      endYear: "2018",
      startYear: "2015",
      img: ic_jiet),
];

List<ProfileAnalyticModel> list = [
  ProfileAnalyticModel(
      name: "Anyone",
      description: "Anyone can comments",
      icon: MaterialCommunityIcons.earth,
      ind: 0),
  ProfileAnalyticModel(
      name: "Connections only",
      description: "connections who can view can also comment",
      icon: FontAwesome.bell_slash_o,
      ind: 1),
  ProfileAnalyticModel(
      name: "No one",
      description: "no one can comment",
      icon: Ionicons.settings_sharp,
      ind: 2),
];
