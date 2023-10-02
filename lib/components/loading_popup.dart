import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

void loadingPopup() {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    Grock.dialog(builder: (_) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  });
}
