class UserModel {
  final String username;
  final String password;
  final DateTime createdAt;
  final DateTime lastLogin;

  UserModel({
    required this.username,

    required this.password,
    required this.createdAt,
    required this.lastLogin,
  });

  // Exemple de méthode pour convertir en Map (utile pour Firebase/JSON)
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,

      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin.toIso8601String(),
    };
  }

  // Exemple pour recréer depuis un Map (Firebase/JSON)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',

      password: map['password'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      lastLogin: DateTime.parse(map['lastLogin']),
    );
  }
}
