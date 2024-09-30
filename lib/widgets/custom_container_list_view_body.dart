import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
import 'custom_app_text.dart';

class CustomContainerListViewBody extends StatelessWidget {
  final String text;
  final Widget icon;
  const CustomContainerListViewBody(
      {super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.greyD9,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: CustomAppText(
              text: text,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          icon,
        ],
      ),
    );
  }
}
