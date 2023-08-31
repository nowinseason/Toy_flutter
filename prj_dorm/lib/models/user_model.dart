import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  // all of these are url based
  final String username;
  final String email;
  final String profilePic;
  final String banner;
  final String uid;

  UserModel({
    required this.username,
    required this.email,
    required this.profilePic,
    required this.banner,
    required this.uid,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? profilePic,
    String? banner,
    String? uid,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      banner: banner ?? this.banner,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'profilePic': profilePic,
      'banner': banner,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      profilePic: map['profilePic'] as String,
      banner: map['banner'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, profilePic: $profilePic, banner: $banner, uid: $uid)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.profilePic == profilePic &&
        other.banner == banner &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        profilePic.hashCode ^
        banner.hashCode ^
        uid.hashCode;
  }
}
