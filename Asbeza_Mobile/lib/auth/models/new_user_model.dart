class NewUser {
  final String name;
  final String email;
  final String? password;
  final String userType;

  NewUser(
      {required this.name,
      required this.email,
      this.password,
      this.userType = "user"});

  factory NewUser.fromJson(Map json) {
    return NewUser(
        name: json['name'] ?? "",
        email: json['email'],
        password: json['password'] ?? "",
        userType: json['user_type']);
  }

  Map<String, String> toMap() {
    var map = new Map<String, String>();
    map["user_name"] = name;
    map["email"] = email;
    map["password"] = password ?? "";
    map["user_type"] = userType;

    return map;
  }
}
