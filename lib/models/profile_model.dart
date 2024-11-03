
  class Profile {
  final int id;
  final int userId;
  final String bio;
  final String profilePicture;

  Profile({
    required this.id,
    required this.userId,
    required this.bio,
    required this.profilePicture,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      userId: json['user'],
      bio: json['bio'],
      profilePicture: json['profile_picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': userId,
      'bio': bio,
      'profile_picture': profilePicture,
    };
  }
}
  