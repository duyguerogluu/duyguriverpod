import 'dart:convert';

import 'package:duyguriverpod/utils/utils.dart';

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('data')) {
      json = json['data'];
    }

    return UserModel(
      id: json.get('id'),
      email: json.get('email'),
      firstName: json.get('first_name'),
      lastName: json.get('last_name'),
      avatar: json.get('avatar'),
    );
  }

  Map<String, dynamic> get json => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
      };

  @override
  String toString() => jsonEncode(json);
}
