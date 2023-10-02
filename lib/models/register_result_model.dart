import 'dart:convert';

import 'package:duyguriverpod/utils/utils.dart';

class RegisterResultModel {
  final String? id;
  final String? token;
  final String? error;

  RegisterResultModel({
    this.id,
    this.token,
    this.error,
  });

  bool get hasError => error != null;

  factory RegisterResultModel.fromJson(Map<String, dynamic> json) {
    return RegisterResultModel(
      id: json.get('id'),
      token: json.get('token'),
      error: json.get('error'),
    );
  }

  Map<String, dynamic> get json => {
        if (id != null) 'id': id,
        if (token != null) 'token': token,
        if (error != null) 'error': error,
      };

  @override
  String toString() => jsonEncode(json);
}
