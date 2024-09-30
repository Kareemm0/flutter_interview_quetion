import 'package:flutter/material.dart';
import 'package:flutter_interview_quetion/constant/app_colors.dart';

class CustomAppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const CustomAppText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 24,
        color: color ?? AppColors.primary,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }
}
