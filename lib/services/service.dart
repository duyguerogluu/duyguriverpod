import 'dart:convert';
import 'dart:developer';

import 'package:duyguriverpod/models/list_users_result_model.dart';
import 'package:duyguriverpod/models/login_result_model.dart';
import 'package:duyguriverpod/utils/const.dart';

import 'package:http/http.dart' as http;

class Service {
  Future<LoginResultModel?> loginCall({
    required String email,
    required String password,
  }) async {
    var response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    var result = LoginResultModel.fromJson(jsonDecode(response.body));
    log("Gelen Response: ${response.statusCode} ${response.body}");
    return result;
  }

  Future<ListUsersResultModel?> listUsersCall() async {
    var response = await http.get(
      Uri.parse("$baseUrl/users?page=2"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    var result = ListUsersResultModel.fromJson(jsonDecode(response.body));
    log("Gelen Response: ${response.statusCode} ${response.body}");
    return result;
  }
}
