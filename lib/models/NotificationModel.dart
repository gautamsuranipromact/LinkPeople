class NotificationModel {
  final String image;
  final String name;
  bool isRead;
  bool isJob;
  bool profileView;

  NotificationModel({
    required this.image,
    required this.name,
    this.isRead = false,
    this.isJob = false,
    this.profileView = false,
  });
}
