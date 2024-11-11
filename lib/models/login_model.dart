class Welcome {
  String name;
  String mobile;
  String email;

  Welcome({
    required this.name,
    required this.mobile,
    required this.email,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      name: json['name'] ?? '',
      mobile: json['mobile'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
