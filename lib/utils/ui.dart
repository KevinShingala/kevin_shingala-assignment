import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ui {
  static GetSnackBar ErrorSnackBar({String title = 'Error', String? message}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.titleLarge!
              .merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(
          (message ?? '').substring(0, min((message ?? '').length, 700)),
          style: Get.textTheme.bodySmall!
              .merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: Icon(Icons.remove_circle_outline,
          size: 32, color: Get.theme.primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }

  static loadingDialog() {
    return Get.dialog(
      PopScope(
        canPop: true,
        // onWillPop: () => Future.value(true),
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: const CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
