import 'package:flutter/material.dart';
import 'package:kevin_assignment/utils/app_textstyle.dart';

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
