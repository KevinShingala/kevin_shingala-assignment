import 'package:flutter/material.dart';
import 'package:kevin_assignment/constants/image_constants.dart';
import 'package:kevin_assignment/utils/app_textstyle.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextfield({
    required this.controller,
    required this.hintText,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            hintText: hintText,
            hintStyle: AppTextStyle.subTitleTextStyle
                .copyWith(color: AppColor.primaryColor.withOpacity(0.5))),
      ),
    );
  }
}
