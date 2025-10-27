class ParticipantModel {
  ParticipantModel({required this.name, required this.avatarUrl});

  final String? name;
  final String? avatarUrl;

  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(name: json["name"], avatarUrl: json["avatar_url"]);
  }
}
