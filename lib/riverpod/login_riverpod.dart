import 'dart:developer';

import 'package:duyguriverpod/components/loading_popup.dart';
import 'package:duyguriverpod/screens/users_screen.dart';
import 'package:duyguriverpod/services/service.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var formState = GlobalKey<FormState>();

  Future<bool> fetchLogin() async {
    print("fetchLogin  çalıştı");
    loadingPopup();

    final sharedPref = await SharedPreferences.getInstance();

    var result = await service.loginCall(
      email: email.text,
      password: password.text,
    );

    if (result?.token != null) {
      sharedPref.setString("token", result!.token!);
      log(result.token!);
      Grock.back();
      Grock.toRemove(const UsersScreen());
      return true;
    }

    Grock.back();
    Grock.snackBar(title: "Hata", description: "Tekrar deneyiniz");
    return false;
  }
}
