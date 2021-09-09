class User {
  final String name;
  final String password;

  User({required this.name, required this.password});

  factory User.fromJson(Map json) {
    return User(
      name: json['user_name'] ?? "",
      password: json['password'] ?? "",
    );
  }

  Map<String, String> toMap() {
    var map = new Map<String, String>();
    map["user_name"] = name;
    map["password"] = password;

    return map;
  }
}
