class LoginResponse {
  LoginResponse({
    this.token,
    this.userEmail,
    this.userNickname,
    this.userDisplayName,
  });

  LoginResponse.fromJson(dynamic json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNickname = json['user_nicename'];
    userDisplayName = json['user_display_name'];
  }

  String? token;
  String? userEmail;
  String? userNickname;
  String? userDisplayName;

  LoginResponse copyWith({
    String? token,
    String? userEmail,
    String? userNickname,
    String? userDisplayName,
  }) =>
      LoginResponse(
        token: token ?? this.token,
        userEmail: userEmail ?? this.userEmail,
        userNickname: userNickname ?? this.userNickname,
        userDisplayName: userDisplayName ?? this.userDisplayName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['user_email'] = userEmail;
    map['user_nicename'] = userNickname;
    map['user_display_name'] = userDisplayName;
    return map;
  }
}
