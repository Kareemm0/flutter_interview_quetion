import 'package:flutter/material.dart';
import 'package:flutter_interview_quetion/constant/app_colors.dart';

import '../widgets/custom_app_text.dart';

void showSnackBar(
  context, {
  required String text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: AppColors.primary,
      content: CustomAppText(
        text: text,
        fontSize: 12,
        color: AppColors.white,
      ),
    ),
  );
}
