class Challenge {
  final String id;
  final String title;
  final int points;

  Challenge({required this.id, required this.title, required this.points});

  factory Challenge.fromMap(Map<String, dynamic> data) {
    return Challenge(
      id: data['id'],
      title: data['title'],
      points: data['points'],
    );
  }
}

