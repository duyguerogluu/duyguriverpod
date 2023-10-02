import 'dart:convert';

import 'package:duyguriverpod/utils/utils.dart';

import 'user_model.dart';

class ListUsersResultModel {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserModel> data;

  ListUsersResultModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    this.data = const [],
  });

  factory ListUsersResultModel.fromJson(Map<String, dynamic> json) {
    return ListUsersResultModel(
      page: json.get('page'),
      perPage: json.get('per_page'),
      total: json.get('total'),
      totalPages: json.get('total_pages'),
      data: (json.get('data') as List<dynamic>)
          .map<UserModel>((element) => UserModel.fromJson(element))
          .toList(growable: false),
    );
  }

  Map<String, dynamic> get json => {
        'page': page,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'data': data.map<Map>((e) => e.json),
      };

  @override
  String toString() => jsonEncode(json);
}
