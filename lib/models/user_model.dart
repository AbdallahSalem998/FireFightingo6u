class UserModel {
  static const String COLLECTION_NAME = "Users";
  String? id;
  String? name;
  String? email;
  String? age;

  UserModel({
    this.id = '',
    required this.name,
    required this.email,
    required this.age,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "age": age,
    };
  }
}
