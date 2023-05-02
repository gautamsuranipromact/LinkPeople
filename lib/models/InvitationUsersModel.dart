class InvitationUsers {
  String? name;
  String? profession;
  int? mutualFriends;
  String? time;
  String? imageUrl;
  String? comment;
  bool? isInvite;
  bool? isFollow;

  InvitationUsers(
      {this.name,
      this.profession,
      this.mutualFriends,
      this.time,
      this.imageUrl,
      this.comment,
      this.isInvite = false,
      this.isFollow = false});
}
