class User {
  final String email;
  final String uid;
  final String imageUrl;
  final String fullname;
  final String phoneNumber;

  const User({
    required this.email,
    required this.uid,
    required this.imageUrl,
    required this.fullname,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "uid": uid,
    "email": email,
    "imageUrl": imageUrl,
    "phoneNumber": phoneNumber
  };
}
