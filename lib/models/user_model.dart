class UserModel {
  final String id;
  final String username;
  final String avatar;
  final int coins;
  final int level;
  final int totalTasksCompleted;

  UserModel({
    required this.id,
    required this.username,
    required this.avatar,
    required this.coins,
    required this.level,
    required this.totalTasksCompleted,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? avatar,
    int? coins,
    int? level,
    int? totalTasksCompleted,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      coins: coins ?? this.coins,
      level: level ?? this.level,
      totalTasksCompleted: totalTasksCompleted ?? this.totalTasksCompleted,
    );
  }
}

