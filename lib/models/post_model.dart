import 'package:link_people/models/comment_model.dart';
import 'package:link_people/models/common_models/post_mdeia_model.dart';
import 'package:link_people/models/get_post_likes_model.dart';

class PostModel {
  String? postId;
  int? activityId;
  int? commentCount;
  List<CommentModel>? comments;
  String? content;
  String? subContent;
  String? dateRecorded;
  int? timestamp;
  bool? isFavorites;
  bool? isLiked;
  String? likeId;
  String? commentId;
  int? likeCount;
  List<String>? mediaList;
  List<String>? imageMediaList;
  String? mediaType;
  String? postIn;
  String? userEmail;
  String? userId;
  String? userImage;
  String? userName;
  List<GetPostLikesModel>? usersWhoLiked;
  bool? isUserVerified;
  List<PostMediaModel>? medias;
  bool? isFriend;
  String? type;
  PostModel? childPost;
  int? blogId;
  int? groupId;
  String? groupName;

  PostModel({
    this.activityId,
    this.postId,
    this.commentCount,
    this.comments,
    this.content,
    this.subContent,
    this.dateRecorded,
    this.timestamp,
    this.isFavorites,
    this.isLiked,
    this.likeId,
    this.commentId,
    this.likeCount,
    this.mediaList,
    this.imageMediaList,
    this.mediaType,
    this.postIn,
    this.userEmail,
    this.userId,
    this.userImage,
    this.userName,
    this.usersWhoLiked,
    this.isUserVerified,
    this.medias,
    this.isFriend,
    this.type,
    this.childPost,
    this.blogId,
    this.groupId,
    this.groupName,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      activityId: json['activity_id'],
      commentCount: json['comment_count'],
      comments: json['comments'] != null
          ? (json['comments'] as List)
              .map((i) => CommentModel.fromJson(i))
              .toList()
          : null,
      content: json['content'],
      subContent: json['subContent'],
      dateRecorded: json['date_recorded'],
      isFavorites: json['is_favorites'],
      isLiked: json['is_liked'],
      likeCount: json['like_count'],
      mediaList: json['media_list'] != null
          ? new List<String>.from(json['media_list'])
          : null,
      mediaType: json['media_type'],
      postIn: json['post_in'],
      userEmail: json['user_email'],
      userId: json['user_id'],
      userImage: json['user_image'],
      userName: json['User_name'],
      isUserVerified: json['is_user_verified'],
      usersWhoLiked: json['users_who_liked'] != null
          ? (json['users_who_liked'] as List)
              .map((i) => GetPostLikesModel.fromJson(i))
              .toList()
          : null,
      medias: json['medias'] != null
          ? (json['medias'] as List)
              .map((i) => PostMediaModel.fromJson(i))
              .toList()
          : null,
      isFriend: json['is_friend'],
      type: json['type'],
      blogId: json['blog_id'],
      childPost: json['child_post'] != null
          ? PostModel.fromJson(json['child_post'])
          : null,
      groupId: json['group_id'],
      groupName: json['group_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity_id'] = this.activityId;
    data['postId'] = this.postId;
    data['comment_count'] = this.commentCount;
    data['timestamp'] = this.timestamp;
    data['content'] = this.content;
    data['subContent'] = this.subContent;
    data['date_recorded'] = this.dateRecorded;
    data['is_favorites'] = this.isFavorites;
    data['is_liked'] = this.isLiked;
    data['like_id'] = this.likeId;
    data['comment_id'] = this.commentId;
    data['like_count'] = this.likeCount;
    data['media_type'] = this.mediaType;
    data['post_in'] = this.postIn;
    data['user_email'] = this.userEmail;
    data['user_id'] = this.userId;
    data['user_image'] = this.userImage;
    data['User_name'] = this.userName;
    data['is_user_verified'] = this.isUserVerified;
    data['is_friend'] = this.isFriend;
    data['type'] = this.type;
    data['blog_id'] = this.blogId;
    data['group_id'] = this.groupId;
    data['group_name'] = this.groupName;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.mediaList != null) {
      data['media_list'] = this.mediaList;
    }
    if (this.imageMediaList != null) {
      data['image_media_list'] = this.imageMediaList;
    }
    if (this.usersWhoLiked != null) {
      data['users_who_liked'] =
          this.usersWhoLiked!.map((v) => v.toJson()).toList();
    }
    if (this.medias != null) {
      data['medias'] = this.medias!.map((v) => v.toJson()).toList();
    }
    if (this.childPost != null) {
      data['child_post'] = this.childPost!.toJson();
    }
    return data;
  }
}
