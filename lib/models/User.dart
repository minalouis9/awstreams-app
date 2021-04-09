class User{
  String key, name, city, bio, profilePic;

  User(
      {this.key,
      this.name,
      this.city,
      this.bio,
      this.profilePic});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        key: json["key"],
        name: json["name"],
        bio: json["biog"],
        city: json["city"],
        profilePic: json["pictures"]["large"]);
  }
}