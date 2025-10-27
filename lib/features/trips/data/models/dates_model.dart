class DatesModel {
  DatesModel({required this.start, required this.end});

  final String? start;
  final String? end;

  factory DatesModel.fromJson(Map<String, dynamic> json) {
    return DatesModel(start: json["start"], end: json["end"]);
  }
}
