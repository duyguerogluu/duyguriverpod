import 'package:duyguriverpod/components/loading_popup.dart';
import 'package:duyguriverpod/models/list_users_result_model.dart';
import 'package:duyguriverpod/models/user_model.dart';
import 'package:duyguriverpod/services/service.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class UsersRiverpod extends ChangeNotifier {
  final service = Service();
  var usersResultData = <UserModel>[];
  bool isLoading = false;

  Future<List<UserModel?>> getData() async {
    loadingPopup();
    isLoading = true;
    notifyListeners();

    try {
      ListUsersResultModel? value = await service.listUsersCall();

      isLoading = false;
      usersResultData = value!.data;
      Grock.back();
      return value.data;
    } catch (error) {
      isLoading = false;
      Grock.back();
      Grock.snackBar(title: "Hata", description: "Bir hata oluştu: $error");
    }
    notifyListeners();
    return <UserModel>[];
  }
}
