import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kevin_assignment/constants/image_constants.dart';
import 'package:kevin_assignment/controller/login_controller.dart';
import 'package:kevin_assignment/utils/app_textstyle.dart';
import 'package:kevin_assignment/views/register_page.dart';
import 'package:kevin_assignment/views/splash_page.dart';
import 'package:kevin_assignment/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: controller.key,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 5),
                        child: Text("Welcome Back",
                            style: AppTextStyle.titleTextStyle
                                .copyWith(color: AppColor.primaryColor)),
                      ),
                      Text("Please Signin to your account",
                          style: AppTextStyle.subTitleTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500])),
                      const SizedBox(
                        height: 60,
                      ),
                      CustomTextfield(
                        controller: controller.emailController.value,
                        hintText: "Email",
                        validator: (p0) {
                          return null;
                        },
                      ),
                      CustomTextfield(
                        controller: controller.passwordController.value,
                        hintText: "Password",
                        validator: (p0) {
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Forgot Password?",
                                style: AppTextStyle.titleTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primaryColor)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          onTap: () {
                            controller.loginUser();
                          },
                          buttonColor: AppColor.primaryColor,
                          textColor: Colors.white,
                          text: "Sign In"),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const RegisterPage());
                        },
                        child: RichText(
                          text: TextSpan(
                              text: "Dont't have an account? ",
                              style: AppTextStyle.subTitleTextStyle.copyWith(
                                color: Colors.grey[400],
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Sign Up",
                                  style:
                                      AppTextStyle.subTitleTextStyle.copyWith(
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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
