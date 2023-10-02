import 'dart:convert';

import 'package:duyguriverpod/utils/utils.dart';

class LoginResultModel {
  final String? token;
  final String? error;

  LoginResultModel({
    this.token,
    this.error,
  });

  bool get hasError => error != null;

  factory LoginResultModel.fromJson(Map<String, dynamic> json) {
    return LoginResultModel(
      token: json.get('token'),
      error: json.get('error'),
    );
  }

  Map<String, dynamic> get json => {
        if (token != null) 'token': token,
        if (error != null) 'error': error,
      };

  @override
  String toString() => jsonEncode(json);
}
