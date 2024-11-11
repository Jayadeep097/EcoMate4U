class UserProfile {
  final String id;
  final String name;
  int ecoPoints;
  List<String> badges;

  UserProfile({required this.id, required this.name, this.ecoPoints = 0, this.badges = const []});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ecoPoints': ecoPoints,
      'badges': badges,
    };
  }
}