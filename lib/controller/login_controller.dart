import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kevin_assignment/utils/ui.dart';
import 'package:kevin_assignment/views/home_Screen.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  var firebase = FirebaseAuth.instance;
  Future<void> loginUser() async {
    if (key.currentState?.validate() ?? false) {
      Ui.loadingDialog();

      try {
        UserCredential userCredential =
            await firebase.signInWithEmailAndPassword(
                email: emailController.value.text,
                password: passwordController.value.text);
        closeDialog();
        Get.offAll(HomeScreen());
      } catch (e) {
        print("sssssssssssss$e");
        closeDialog();
        Ui.ErrorSnackBar(message: e.toString()).show();
      }
    }
  }

  void closeDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
