class AppUser {
  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURl,
    required this.createAt,
  });

  late String uid;
  late String name;
  late String email;
  late String photoURl;

  late String createAt;

  AppUser.fromJson(Map<String, dynamic> json) {
    photoURl = json['image'] ?? '';
    name = json['name'] ?? '';
    uid = json['id'] ?? '';
    createAt = json['create_at'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = photoURl;
    data['name'] = name;
    data['id'] = uid;
    data['create_at'] = createAt;
    data['email'] = email;
    return data;
  }
}
