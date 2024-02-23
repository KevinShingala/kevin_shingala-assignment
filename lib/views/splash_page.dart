import 'package:flutter/material.dart';
import 'package:kevin_assignment/constants/image_constants.dart';
import 'package:kevin_assignment/utils/app_textstyle.dart';
import 'package:kevin_assignment/utils/ui.dart';
import 'package:kevin_assignment/views/login_page.dart';
import 'package:kevin_assignment/views/register_page.dart';
import 'package:get/route_manager.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  IMAGES.bgImage,
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("Welcome to\nMy Assignment",
                    style: AppTextStyle.titleTextStyle.copyWith()),
              ),
              Text("Hello Vivatech R&D",
                  style: AppTextStyle.subTitleTextStyle.copyWith()),
              const Spacer(),
              CustomButton(
                onTap: () {
                  // Ui.loadingDialog();

                  Get.to(const RegisterPage());
                },
                text: "Sign Up",
                textColor: AppColor.primaryColor,
                buttonColor: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {
                  Get.to(const LoginPage());
                },
                text: "Sign In",
                textColor: Colors.white,
                buttonColor: AppColor.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Color buttonColor;
  final Color textColor;
  final String text;
  const CustomButton({
    required this.onTap,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(30)),
        child: Text(
          text,
          style: AppTextStyle.titleTextStyle
              .copyWith(color: textColor, fontSize: 22),
        ),
      ),
    );
  }
}
