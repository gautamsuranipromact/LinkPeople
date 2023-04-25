class PagesModel {
  String? name;
  int? followers;
  String? image;
  String? coverPhoto;
  bool? isFollow;

  PagesModel(
      {this.name,
      this.followers,
      this.image,
      this.coverPhoto,
      this.isFollow = false});
}
