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
      name: json['name'] ?? '',    // Default to empty string if key doesn't exist
      mobile: json['mobile'] ?? '', // Default to empty string if key doesn't exist
      email: json['email'] ?? '',   // Default to empty string if key doesn't exist
    );
  }
}
