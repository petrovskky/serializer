class User {
  String id;
  String name;
  String email;
  bool isActive;
  String phone;
  DateTime? birthday;
  String? photoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.phone,
    this.birthday,
    this.photoUrl,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        isActive = json['isActive'] == 'true',
        phone = json['phone'],
        birthday =
            json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
        photoUrl = json['photoUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'isActive': isActive.toString(),
        'phone': phone,
        'birthday': birthday?.toIso8601String(),
        'photoUrl': photoUrl,
      };

  void edit({
    String? newName,
    String? newPhone,
    DateTime? newBirthday,
    String? newPhotoUrl,
  }) {
    if (newName != null) name = newName;
    if (newPhone != null) phone = newPhone;
    if (newBirthday != null) birthday = newBirthday;
    if (newPhotoUrl != null) photoUrl = newPhotoUrl;
  }

  void updateStatus(bool newStatus) {
    isActive = newStatus;
  }
}
