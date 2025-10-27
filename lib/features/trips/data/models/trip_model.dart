import 'package:users/features/trips/data/models/dates_model.dart';
import 'package:users/features/trips/data/models/participant_model.dart';

class TripModel {
  TripModel({
    required this.id,
    required this.status,
    required this.title,
    required this.dates,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImage,
  });

  final String? id;
  final String? status;
  final String? title;
  final DatesModel? dates;
  final List<ParticipantModel> participants;
  final int? unfinishedTasks;
  final String? coverImage;

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json["id"],
      status: json["status"],
      title: json["title"],
      dates: json["dates"] == null ? null : DatesModel.fromJson(json["dates"]),
      participants: json["participants"] == null
          ? []
          : List<ParticipantModel>.from(
              json["participants"]!.map((x) => ParticipantModel.fromJson(x)),
            ),
      unfinishedTasks: json["unfinished_tasks"],
      coverImage: json["cover_image"],
    );
  }
}
