import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kevin_assignment/constants/image_constants.dart';
import 'package:kevin_assignment/controller/register_controller.dart';
import 'package:kevin_assignment/utils/app_textstyle.dart';
import 'package:kevin_assignment/views/login_page.dart';
import 'package:kevin_assignment/views/splash_page.dart';
import 'package:kevin_assignment/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    IMAGES.bgImage,
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              child: Form(
                key: controller.key,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    // physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 5),
                        child: Text("Register",
                            style: AppTextStyle.titleTextStyle
                                .copyWith(color: AppColor.primaryColor)),
                      ),
                      Text("Please Create your account",
                          style: AppTextStyle.subTitleTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500])),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                        hintText: "Fist Name",
                        controller: controller.firstNameController.value,
                        validator: (p0) {
                          if ((p0 ?? '').isEmpty) {
                            return "Please Enter First Name";
                          }
                          return null;
                        },
                      ),
                      CustomTextfield(
                        controller: controller.lastNameController.value,
                        hintText: "Last Name",
                        validator: (p0) {
                          if ((p0 ?? '').isEmpty) {
                            return "Please Enter Last Name";
                          }
                          return null;
                        },
                      ),
                      CustomTextfield(
                        controller: controller.emailController.value,
                        hintText: "Email",
                        validator: (p0) {
                          if ((p0 ?? '').isEmpty) {
                            return "Please Enter your Eail";
                          }
                          return null;
                        },
                      ),
                      CustomTextfield(
                        controller: controller.passwordController.value,
                        hintText: "Password",
                        validator: (p0) {
                          if ((p0 ?? '').isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                      ),
                      // const Spacer(),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomButton(
                          onTap: () {
                            controller.registerUser();
                          },
                          buttonColor: AppColor.primaryColor,
                          textColor: Colors.white,
                          text: "Sign Up"),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const LoginPage());
                        },
                        child: RichText(
                          text: TextSpan(
                              text: "Already have an account? ",
                              style: AppTextStyle.subTitleTextStyle.copyWith(
                                color: Colors.grey[400],
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Login",
                                  style:
                                      AppTextStyle.subTitleTextStyle.copyWith(
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
