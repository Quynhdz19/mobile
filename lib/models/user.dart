class User {
  final String email;
  final String uid;
  final String imageUrl;
  final String fullname;
  final String phoneNumber;
  final int score;
  final int level;

  const User(
      {required this.email,
      required this.uid,
      required this.imageUrl,
      required this.fullname,
      required this.phoneNumber,
      required this.score,
      required this.level});

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "uid": uid,
        "email": email,
        "imageUrl": imageUrl,
        "phoneNumber": phoneNumber
      };

  static User fromJson(Map<String, dynamic> json) => User(
      uid: json['uid'],
      fullname: json['fullname'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      phoneNumber: json['phoneNumber'],
      score: json['total_score'],
      level: json['level']);
}
