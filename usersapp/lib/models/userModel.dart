class UserModel {
  final String name;
  final String email;
  final int age;

  // Constructor to initialize UserModel
  UserModel({
    required this.name,
    required this.email,
    required this.age,
  });

  // Factory method to create UserModel from JSON data
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }
}
