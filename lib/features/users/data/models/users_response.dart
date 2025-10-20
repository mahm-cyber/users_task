import 'package:users/features/users/data/models/user_model.dart';

class UsersResponse {
  UsersResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UserModel> data;

  factory UsersResponse.fromJson(Map<String, dynamic> json) {
    print('Current Json $json');
    return UsersResponse(
      page: json["page"],
      perPage: json["per_page"],
      total: json["total"],
      totalPages: json["total_pages"],
      data: json["data"] == null
          ? []
          : List<UserModel>.from(
              json["data"]!.map((x) => UserModel.fromJson(x)),
            ),
    );
  }
}
