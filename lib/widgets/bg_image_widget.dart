import 'package:flutter/material.dart';
import 'package:kevin_assignment/constants/image_constants.dart';

class BgImageWidget extends StatelessWidget {
  final Widget child;
  const BgImageWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: child));
  }
}
