import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kevin_assignment/utils/ui.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:kevin_assignment/views/home_Screen.dart';

class RegisterController extends GetxController {
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  var firebase = FirebaseAuth.instance;
  Future<void> registerUser() async {
    if (key.currentState?.validate() ?? false) {
      Ui.loadingDialog();
      try {
        UserCredential userCredential =
            await firebase.createUserWithEmailAndPassword(
                email: emailController.value.text,
                password: passwordController.value.text);
        closeDialog();
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'fName': firstNameController.value.text,
          'lName': lastNameController.value.text,
          'email': emailController.value.text,
          'uid': userCredential.user?.uid
        });
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
