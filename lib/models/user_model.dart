class UserModel {
  final String id;
  final String nom;
  final String email;
  final String role;
  final String token;

  UserModel({
    required this.id,
    required this.nom,
    required this.email,
    required this.role,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["user"]["_id"],
      nom: json["user"]["nom"],
      email: json["user"]["email"],
      role: json["user"]["role"],
      token: json["token"],
    );
  }
}
