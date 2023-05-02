import 'dart:io';

import 'package:video_player/video_player.dart';

class PostMediaModel {
  String type;
  File file;
  VideoPlayerController? controller;

  PostMediaModel({required this.type, required this.file, this.controller});

  factory PostMediaModel.fromJson(Map<String, dynamic> json) {
    return PostMediaModel(
      type: json['type'],
      file: json['file'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['file'] = this.file;
    return data;
  }
}
